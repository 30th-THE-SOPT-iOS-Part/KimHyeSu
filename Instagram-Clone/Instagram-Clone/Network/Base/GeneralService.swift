//
//  GeneralService.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/15.
//

import Foundation

struct GeneralService {
    
    static func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<T>.self, from: data)
        else { return .pathErr }
        print(decodedData)
        switch statusCode {
        case 200:
            return .success(decodedData.data)
        case 201..<300:
            return .success(decodedData.status)
        case 400..<500:
            return .requestErr(decodedData.status)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
