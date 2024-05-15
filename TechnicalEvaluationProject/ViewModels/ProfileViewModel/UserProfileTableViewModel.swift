//
//  UserProfileTableViewModel.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/13/24.
//

import Foundation
import UIKit

class UserProfileTableViewModel {
    
    var users: [User] = [] // Array to hold fetched user data
    
    func fetchUsers(completion: @escaping () -> Void) {
        // Call the fetchUsers method from the ProfileViewModel to fetch user data
        ProfileViewModel().fetchUsers { [weak self] fetchedUsers in
            self?.users = fetchedUsers
            completion()
        }
    }
    
    func numberOfRows(in section: Int) -> Int {
        users.count // Return the number of users in the array
    }
    
    func user(at indexPath: IndexPath) -> User? {
        guard indexPath.row < users.count else { return nil }
        return users[indexPath.row] // Return the user at the specified index path
    }
    
    func updateUsers(_ users: [User]) {
        self.users = users
    }
}
