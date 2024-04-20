//
//  File.swift
//  IOS_VIPER
//
//  Created by Ramesh on 20/04/24.
//

import Foundation
import Alamofire

enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidData
    // Add more cases as needed
}

struct BaseResponse<T: Decodable>: Decodable {
    let status: String
    let message: String?
    let data: T?
}

class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    // MARK: - HTTP Methods
    
    func fetchData<T: Decodable>(method: HTTPMethod, url: URL, parameters: [String: Any]? = nil, queryParams: [String: Any]? = nil, completion: @escaping (Result<BaseResponse<T>, Error>) -> Void) {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        if let queryParams = queryParams {
            var queryItems = [URLQueryItem]()
            for (key, value) in queryParams {
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            urlComponents?.queryItems = queryItems
        }
        
        guard let finalURL = urlComponents?.url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        AF.request(finalURL, method: method, parameters: parameters, encoding: JSONEncoding.default).validate().responseDecodable(of: BaseResponse<T>.self) { response in
            switch response.result {
            case .success(let baseResponse):
                completion(.success(baseResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Helper Method
    
    func performRequest<T: Decodable>(method: HTTPMethod, urlString: String, parameters: [String: Any]? = nil, queryParams: [String: Any]? = nil, completion: @escaping (Result<BaseResponse<T>, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        fetchData(method: method, url: url, parameters: parameters, queryParams: queryParams, completion: completion)
    }
    
    // Add more methods as needed
}
