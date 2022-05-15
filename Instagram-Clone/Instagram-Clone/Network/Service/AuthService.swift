//
//  AuthService.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/15.
//

import Foundation

import Alamofire

struct AuthService {
    
    static let shared = AuthService()
    
    func postSignin(user: AuthRequest,
                    completion: @escaping (NetworkResult<Any>) -> Void) {
        AF.request(UserRouter.authSignin(login: user))
            .validate(statusCode: 200...500)
            .responseData { res in
                switch res.result {
                case.success(let data):
                    let statusCode = res.response?.statusCode
                    let data = data
                    let networkResult = GeneralService.judgeStatus(by: statusCode ?? 0, data, SigninResponse.self)
                    completion(networkResult)
                case .failure(let err):
                    print(err)
                }
            }
    }
    
    func postSignup(user: AuthRequest,
                    completion: @escaping (NetworkResult<Any>) -> Void) {
        AF.request(UserRouter.authSignup(join: user))
            .validate(statusCode: 200...500)
            .responseData { res in
                switch res.result {
                case.success(let data):
                    let statusCode = res.response?.statusCode
                    let data = data
                    let networkResult = GeneralService.judgeStatus(by: statusCode ?? 0, data, SignupResponse.self)
                    completion(networkResult)
                case .failure(let err):
                    print(err)
                }
            }
    }
}
