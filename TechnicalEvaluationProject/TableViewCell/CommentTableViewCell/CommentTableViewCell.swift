//
//  CommentTableViewCell.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/14/24.
//

import UIKit
import SDWebImage

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var commentLabel : UILabel!
    @IBOutlet weak var profileImageView : UIImageView!
    var model = UserComments()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure (_ data: Any?) {
        guard let data = data as? UserComments else { return }
        self.model = data
        nameLabel.text = data.name
        commentLabel.text = data.comment
        if let media = data.profileImageURL {
            profileImageView.sd_setImage(with: URL(string: media), placeholderImage: UIImage(named: ""))
            profileImageView.layer.cornerRadius = 25
        }
        
    }
    
}
