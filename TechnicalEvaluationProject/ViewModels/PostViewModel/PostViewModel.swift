//
//  File.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/14/24.
//

import Foundation
import UIKit

class PostViewModel {
    private let mockAPIService = MockAPIService()
    
    @Published var user: User? // Only one user
    
    func fetchUser(completion: @escaping (User?) -> Void) {
        mockAPIService.fetchPostData { [weak self] data, error in
            if let data = data {
                let jsonString = String(data: data, encoding: .utf8)
                print("Received JSON data: \(jsonString ?? "Empty")")
            }
            guard let data = data else {
                print("Error fetching mock data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil) // Pass nil in case of error
                return
            }
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data) // Only one user
                DispatchQueue.main.async {
                    self?.user = user
                    completion(user) // Pass fetched user to the completion closure
                }
            } catch {
                print("Error decoding mock data: \(error)")
                completion(nil) // Pass nil in case of decoding error
            }
        }
    }
}
