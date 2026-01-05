//
//  NoIssueView.swift
//  UltimatePortfolio
//
//  Created by Thomas Cavalli on 1/1/26.
//

import SwiftUI
struct NoIssueView: View {
    @EnvironmentObject var dataController: DataController
    var body: some View {
        Text("No Issue Selected!")
            .font(.title)
            .foregroundStyle(.secondary)
        Button("New Issue") {
            dataController.newIssue()
        }
    }
}
