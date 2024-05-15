//
//  TableViewCell.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/13/24.
//

import UIKit
import SDWebImage


protocol ProfileTableViewCellProtocol : NSObjectProtocol {
    func didTapCommentButton(_ cell: ProfileTableViewCell)
}

class ProfileTableViewCell: UITableViewCell {
    
    weak var delegate: ProfileTableViewCellProtocol?
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    var isLiked : Bool?
    var user : User? {
        didSet {
            configure()
        }
    }

    @IBAction func likeButtonTapped(_ sender: UIButton) {
        toggleLikeStatus()
        configureLikeButton()
    }
    
    @IBAction func commentButtonTapped(_ sender: UIButton) {
        delegate?.didTapCommentButton(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure() {
        guard let userData = user else { return }
        userNameLabel.text = userData.name
        descriptionLabel.text = userData.descrip
        if let media = userData.profileImageURL {
            profileImageView.sd_setImage(with: URL(string: media), placeholderImage: UIImage(named: ""))
            profileImageView.layer.cornerRadius = 12
        }
        likeCountLabel.text = "\(userData.likeCount ?? 1)likes"
        commentCountLabel.text = "\(userData.commentCount ?? 1)likes"
    }
    
    private func configureLikeButton() {
        guard let userData = user else { return }
        let likeImageName = userData.isLiked ?? false ? "thumbsup.fill" : "thumbsup"
        likeImageView.image = UIImage(named: likeImageName)
    }
    
    private func toggleLikeStatus() {
        guard var userData = user else { return }
        userData.isLiked = !(userData.isLiked ?? false)
        user = userData
    }
    
}
