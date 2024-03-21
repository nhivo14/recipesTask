//
//  NetworkService.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import Foundation
import Alamofire

class NetworkService {
        
    private let baseURL: String
    
    init() {
        self.baseURL = NetworkConstant.baseURL
    }
    
    private func makeFullURL(endpoint: String) -> String {
        return baseURL + endpoint
    }
    
    // MARK: - Generic Request
    
    private func request<T: Decodable>(endpoint: String,
                                       method: HTTPMethod,
                                       parameters: Parameters? = nil,
                                       encoding: ParameterEncoding = URLEncoding.default,
                                       headers: HTTPHeaders? = nil,
                                       completion: @escaping (Result<T, Error>) -> Void) {
        
        let fullURL = makeFullURL(endpoint: endpoint)
        
        AF.request(fullURL,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: T.self) { response in
            
            switch response.result {
            case .success(let value):
//                if let responseData = response.data,
//                   let jsonString = self.convertDataToJSONString(responseData) {
//                    print("Response data as JSON: \(jsonString)")
//                }
                completion(.success(value))
            case .failure(let error):
//                if let responseData = response.data,
//                   let jsonString = self.convertDataToJSONString(responseData) {
//                    print("Response data as JSON: \(jsonString)")
//                }
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - HTTP Methods
    
    func get<T: Decodable>(endpoint: String,
                           parameters: Parameters? = nil,
                           headers: HTTPHeaders? = nil,
                           completion: @escaping (Result<T, Error>) -> Void) {
        
        request(endpoint: endpoint, method: .get, parameters: parameters, headers: headers, completion: completion)
    }
    
    func post<T: Decodable>(endpoint: String,
                            parameters: Parameters? = nil,
                            encoding: ParameterEncoding = JSONEncoding.default,
                            headers: HTTPHeaders? = nil,
                            completion: @escaping (Result<T, Error>) -> Void) {
        
        request(endpoint: endpoint, method: .post, parameters: parameters, encoding: encoding, headers: headers, completion: completion)
    }
    
    
}

extension NetworkService {
    private func convertDataToJSONString(_ data: Data) -> String? {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Error converting data to JSON string: \(error)")
            return nil
        }
    }
}
