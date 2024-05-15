//
//  UserListViewController.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/13/24.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, ProfileTableViewCellProtocol{
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = ProfileViewModel()
    private let tableViewModel = UserProfileTableViewModel()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
       
    }
    
    @IBAction func onTapPost(_ sender: Any) {
        let destVc = storyboard?.instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
        destVc.delegate = self
        navigationController?.pushViewController(destVc, animated: true)
    }
    
    func didTapCommentButton(_ cell: ProfileTableViewCell) {
        let destVc = storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        navigationController?.pushViewController(destVc, animated: true)
    }
    
    // MARK: - Private Functions
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(ProfileTableViewCell.reuseIdentifier)
        
        fetchUsers()
    }
    
    private func fetchUsers() {
        tableViewModel.fetchUsers { [weak self] in
            self?.tableView.reloadData() // Reload table view when data is fetched
        }
    }
}

// MARK: - Extension ProfileViewController
extension ProfileViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.delegate = self
        if let user = tableViewModel.user(at: indexPath) {
            cell.user = user // Pass the user data to the cell
        }
        return cell
    }
}

// MARK: - ProfileViewModelDelegate
extension ProfileViewController: PostViewControllerProtocol {
    func didUpdateUsers(_ user: User) {
        viewModel.users = tableViewModel.users
        viewModel.users.append(user)
        tableViewModel.updateUsers(viewModel.users)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
