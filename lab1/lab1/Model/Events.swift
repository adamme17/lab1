//
//  Events.swift
//  lab1
//
//  Created by Adam Bokun on 25.10.21.
//

import Foundation

struct Events: Codable {
    let type: String
    let actor: Actor
    let repo: Repo
    let created_at: String
}

struct Actor: Codable {
    let login: String
    let avatar_url: String
}

struct Repo: Codable {
    let name: String
}
