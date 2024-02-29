//
//  Entity_Account.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import Foundation

enum AccountRole {
    case admin
    case member
}

struct AccountEntity: Codable, Identifiable {
    var id: String
    var email: String
//    var password: String
    var name: String
    var avatar: String
    var associatedWorkspaces: [String]
    var taskAssigned: [String]
    var taskCreated: [String]
    var workspaceOwned: [String]
    var isActive: Bool
    var joined: TimeInterval
    
}
