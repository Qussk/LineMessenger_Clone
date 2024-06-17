//
//  AutnenticationService.swift
//  LineMessengerClone
//
//  Created by 변윤나 on 6/14/24.
//

import Foundation
import Combine
import FirebaseCore
import FirebaseAuth
import GoogleSignIn


enum AuthenticationError: Error {
    case clientError
    case tokenError
    case invaliedated
}
protocol AuthenticationServiceType {
    func signInWithGoogle() -> AnyPublisher<User, ServiceError>
}


class AuthenticationService: AuthenticationServiceType {

    func signInWithGoogle() -> AnyPublisher<User, ServiceError> {
        Future { [weak self] promise in
            self?.signInWithGoogle { result in
                switch result {
                case let .success(user):
                    promise(.success(user))
                case let .failure(error):
                    promise(.failure(.error(error)))
                }
            }
        }.eraseToAnyPublisher()

    }
    
    
}

extension AuthenticationService {
    //GoogleLogin
    func signInWithGoogle(complcation: @escaping (Result<User, Error> ) -> Void ) {
        guard let clienID = FirebaseApp.app()?.options.clientID else {
            complcation(.failure(AuthenticationError.clientError))
            return
        }
        
        let config = GIDConfiguration(clientID: clienID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowsScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowsScene.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }
                
                
        //GIDSignIn을 통해서 SignIn잔향. 완료가 됐을시 컴플리션 호출.
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self] result, error in
            if let error {
                complcation(.failure(error))
                return
            }
            
            //성공시 ID,resultToken 빼기.
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                complcation(.failure(AuthenticationError.tokenError))
                return
            }
            
            let accessToken = user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            
            self?.authenticateUserWithFirebase(credential: credential , completion: complcation)

        }
    }
    
    //firebase 인증
    private func authenticateUserWithFirebase(credential: AuthCredential, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(with: credential) { result, error in
            if let error {
                completion(.failure(error))
            }
            
            guard let result else {
                completion(.failure(AuthenticationError.invaliedated))
                return
            }
            
            let firebaseUser = result.user
            let user: User = .init(id: firebaseUser.uid, name: firebaseUser.displayName ?? "",
                                   phoneNumber: firebaseUser.phoneNumber,
                                   profileURL: firebaseUser.photoURL?.absoluteString)
            
            completion(.success(user))
        }
    }
    
}

class StubAuthenticationService: AuthenticationServiceType {
    func signInWithGoogle() -> AnyPublisher<User, ServiceError> {
        Empty().eraseToAnyPublisher()
    }
    
    
}
