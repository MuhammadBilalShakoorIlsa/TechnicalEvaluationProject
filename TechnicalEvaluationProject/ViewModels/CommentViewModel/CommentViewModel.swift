//
//  CommentViewModel.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/14/24.
//

import Foundation
import UIKit

class CommentViewModel {
    private let mockAPIService = MockAPIService()
    
    @Published var comment: [UserComments] = []
    
    func fetchComments(completion: @escaping ([UserComments]) -> Void) {
        mockAPIService.fetchCommentData { [weak self] data, error in
            if let data = data {
                let jsonString = String(data: data, encoding: .utf8)
                print("Received JSON data: \(jsonString ?? "Empty")")
            }
            guard let data = data else {
                print("Error fetching mock data: \(error?.localizedDescription ?? "Unknown error")")
                completion([]) // Pass an empty array in case of error
                return
            }
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([UserComments].self, from: data)
                DispatchQueue.main.async {
                    self?.comment = users
                    completion(users) // Pass fetched users to the completion closure
                }
            } catch {
                print("Error decoding mock data: \(error)")
                completion([]) // Pass an empty array in case of decoding error
            }
        }
    }

}
