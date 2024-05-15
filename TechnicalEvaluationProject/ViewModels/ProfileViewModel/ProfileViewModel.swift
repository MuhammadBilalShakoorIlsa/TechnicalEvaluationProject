//
//  ProfileListViewModel.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/13/24.
//

import Foundation
import UIKit

class ProfileViewModel {
    
    private let mockAPIService = MockAPIService() 
    
    @Published var users: [User] = []
    
    func fetchUsers(completion: @escaping ([User]) -> Void) {
        mockAPIService.fetchMockData { [weak self] data, error in
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
                let users = try decoder.decode([User].self, from: data)
                DispatchQueue.main.async {
                    self?.users = users
                    completion(users) // Pass fetched users to the completion closure
                }
            } catch {
                print("Error decoding mock data: \(error)")
                completion([]) // Pass an empty array in case of decoding error
            }
        }
    }
}

