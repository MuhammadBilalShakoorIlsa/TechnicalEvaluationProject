//
//  TableViewCell.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/13/24.
//

import UIKit

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
    }
    
    private func configureLikeButton() {
        guard let userData = user else { return }
        let likeImageName = userData.isLiked ?? false ? "thumbsup.fill" : "thumbsup"
        likeImageView.image = UIImage(named: likeImageName)
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        configureLikeButton()
    }
    
    @IBAction func commentButtonTapped(_ sender: UIButton) {
        delegate?.didTapCommentButton(self)
    }
    
}
