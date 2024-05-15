//
//  ApiService.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/9/24.
//

import Foundation

class MockAPIService {
    
    private let mockURL = URL(string: "https://run.mocky.io/v3/7484deee-c052-4a81-b323-495ee3a86327")!
    private let postURL = URL(string: "https://run.mocky.io/v3/0253d587-31bb-498e-a2ea-41237d0c96e4")!
    private let commentURL = URL(string: "https://run.mocky.io/v3/7bbe3e62-e638-42d6-acbc-69a8b45c8c9f")!
    
    func fetchMockData(completion: @escaping (Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: mockURL) { data, response, error in
            completion(data, error)
        }.resume()
    }
    
    func fetchPostData(completion: @escaping (Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: postURL) { data, response, error in
            completion(data, error)
        }.resume()
    }
    func fetchCommentData(completion: @escaping (Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: commentURL) { data, response, error in
            completion(data, error)
        }.resume()
    }
    
}
