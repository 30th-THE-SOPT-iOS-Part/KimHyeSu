//
//  AuthRouter.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/15.
//

import Foundation

import Alamofire

enum UserRouter: URLRequestConvertible {
    
    case authSignin(login: AuthRequest)
    case authSignup(join: AuthRequest)
    
    var baseURL: URL {
        return URL(string: URLConstants.baseURL)!
    }
    
    var method: HTTPMethod {
        switch self {
        case .authSignin, .authSignup:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .authSignin:
            return URLConstants.authSignin
        case .authSignup:
            return URLConstants.authSignup
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .authSignin, .authSignup:
            return NetworkConstants.header
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .authSignin(let signin):
            return ["name": signin.name,
                    "email": signin.email,
                    "password": signin.password]
        case .authSignup(let signup):
            return ["email": signup.email,
                    "name": signup.name,
                    "password": signup.password]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        switch self {
        case .authSignin, .authSignup:
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }
        
        return request
    }
}
