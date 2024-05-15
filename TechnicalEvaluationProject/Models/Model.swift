//
//  Model.swift
//  TechnicalEvaluationProject
//
//  Created by Muhammad Bilal Shakoor on 5/13/24.
//

import Foundation

class User: NSObject, Codable {
    var id : Int?
    var name: String? // Name of the user
    var descrip: String? // User description
    var isLiked: Bool? // Indicates whether the user is liked or not
    var likeCount: Int? // Number of likes for the user
    var commentCount: Int? // Number of comments for the user
    var profileImageURL: String? // URL string for the user's profile image

    private enum CodingKeys: String, CodingKey {
        case id = "post_id"
        case name = "name"
        case descrip = "description"
        case isLiked = "is_Liked"
        case likeCount = "like_count"
        case commentCount = "comment_count"
        case profileImageURL = "profile_image_url"
    }
}


class UserComments: NSObject, Codable {
    var name: String?
    var comment: String? // comments of the users
    var commentID: Int? //comment Id
    var profileImageURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case comment = "comment"
        case commentID = "comment_id"
        case profileImageURL = "profile_image_url"
        
    }
}
