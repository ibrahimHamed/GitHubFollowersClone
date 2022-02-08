//
//  User.swift
//  GitHubFollowersClone
//
//  Created by Ibrahim Hamed on 08/02/2022.
//

import Foundation

struct User : Codable {
    var login: String
    var avatarURL: String
    var htmlURL: String
    var name: String?
    var location: String?
    var bio : String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var createdAt : String
}
