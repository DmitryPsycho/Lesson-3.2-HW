//
//  File.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 13.08.2022.
//

import Foundation
import Alamofire

enum Link: String {
    case randomUserApi = "https://randomuser.me/api/"
}
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPicture(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    func fetch(from url: String, completion: @escaping(Result<[RandomUser], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let user = RandomUser.getUser(from: value)
                    completion(.success(user))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
