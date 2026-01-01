//
//  Tag-CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Thomas Cavalli on 1/1/26.
//

import Foundation

extension Tag {
    var tagID: UUID {
        id ?? UUID()
    }
    var tagName: String {
        name ?? ""
    }
    var tagActiveIssues: [Issue] {
        let result = issues?.allObjects as? [Issue] ?? []
        return result.filter { $0.completed == false }
    }
}
extension Tag: Comparable {
    public static func < (lhs: Tag, rhs: Tag) -> Bool {
        let left = lhs.tagName.localizedLowercase
        let right = rhs.tagName.localizedLowercase
        if left == right {
            return lhs.tagID.uuidString < rhs.tagID.uuidString
        }
        return left < right
    }
}
