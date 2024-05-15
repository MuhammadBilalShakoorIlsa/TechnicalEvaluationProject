//
//  CommentView.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/14/24.
//

import Foundation
import UIKit
class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    
    // MARK: - Properties
    private var viewModel = CommentViewModel()
    private var comments: [UserComments] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        commentTextField.delegate = self
        commentTextField.text = "Type Something"
        commentTextField.textColor = UIColor.lightGray
    }
    
    // MARK: - IBActions
    @IBAction func sendButtonTapped(_ sender: Any) {
        guard let newText = commentTextField.text, !newText.isEmpty else {
            // Handle case when there's no text to post
            return
        }
        // Post the comment or handle it according to your app's logic
        
        // Clear the text field after posting
        commentTextField.text = ""
        commentTextField.textColor = UIColor.lightGray
    }
    
    // MARK: - Private Functions
    private func setupTableView() {
        tableView.registerNib(CommentTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        fetchComments()
    }
    
    private func fetchComments() {
        viewModel.fetchComments { [weak self] comments in
            self?.comments = comments
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Type Something" {
            textField.text = ""
            textField.textColor = UIColor.black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.text = "Type Something"
            textField.textColor = UIColor.lightGray
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
        cell.configure(comments[indexPath.row])
        return cell
    }
}
