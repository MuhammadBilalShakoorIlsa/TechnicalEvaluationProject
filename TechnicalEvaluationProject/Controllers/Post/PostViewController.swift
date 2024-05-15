//
//  PostViewController.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/14/24.
//

import Foundation
import UIKit

protocol PostViewControllerProtocol: NSObjectProtocol {
    func didUpdateUsers(_ user: User)
}


class PostViewController: UIViewController, UITextViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var postTextView: UITextView!
    weak var delegate: PostViewControllerProtocol?
    @IBOutlet weak var profileImageView: UIImageView!
    // MARK: - Properties
    private var viewModel = PostViewModel()
    private var user: User?
    //let userName = "Joseph" // Assuming the user's name is Joseph
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    @IBAction func postButtonTapped(_ sender: Any) {
        guard let newText = postTextView.text, !newText.isEmpty else {
            // Handle case when there's no text to post
            return
        }

        fetchUser()
        postTextView.text = "What's happening"  // Optionally, clear the text view after posting
        postTextView.textColor = UIColor.lightGray
    }
    
    // MARK: - Private Functions
    private func setView() {
        postTextView.delegate = self
        postTextView.text = "What's happening"
        postTextView.textColor = UIColor.lightGray
        profileImageView.layer.cornerRadius = 25
    }
    
    private func fetchUser() {
        viewModel.fetchUser { [weak self] user in
            self?.user = user
            self?.delegate?.didUpdateUsers(user ?? User())
        }
    }
    
    // MARK: - UITextViewDelegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "What's happening" {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's happening"
            textView.textColor = UIColor.lightGray
        }
    }
}
