//
//  Entity_Workspace.swift
//  Swiftodo
//
//  Created by Nguyen Phuc Loi on 29/02/2024.
//

import Foundation

struct WorkspaceEntity: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var owner: String
    var members: [String]
    var tasks: [String]
}
