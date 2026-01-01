//
//  Issue-CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Thomas Cavalli on 1/1/26.
//

import Foundation

extension Issue {
    var issueTitle: String {
        get { title ?? ""}
        set { title = newValue }
    }
    var issueContent: String {
        get { content ?? ""}
        set { content = newValue }
    }
    var issueCreationDate: Date {
        creationDate ?? .now
        
    }
    var issueModificationDate: Date {
        modificationDate ?? .now
    }
    var issueTags: [Tag] {
        let result = tags?.allObjects as? [Tag] ?? []
        return result.sorted()
    }
}
extension Issue: Comparable {
    public static func < (lhs: Issue, rhs: Issue) -> Bool {
        let left = lhs.issueTitle.localizedLowercase
        let right = rhs.issueTitle.localizedLowercase
        if left == right {
            return lhs.issueCreationDate < rhs.issueCreationDate
        }
        return left < right
    }
}
