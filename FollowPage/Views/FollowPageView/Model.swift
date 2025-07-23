//
//  Model.swift
//  FollowPage
//
//  Created by Rajendran Eshwaran on 7/21/25.
//

import Foundation

struct FollowPageModel {
    let followers: Int
    let following: Int
    let post: Int
    
    static let sample: FollowPageModel = .init(followers: 1340, following: 89480, post: 2093)
}

struct FollowerProfileModel: Hashable {
    let username: String
    let fullName: String
    let profilePictureURL: String
    
    static let profileSample: [FollowerProfileModel] = [FollowerProfileModel(
        username: "rajeeshwaran",
        fullName: "Rajendran Eshwaran",
        profilePictureURL: "")]
}
