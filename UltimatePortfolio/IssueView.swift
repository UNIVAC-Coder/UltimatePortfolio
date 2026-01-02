//
//  IssueView.swift
//  UltimatePortfolio
//
//  Created by Thomas Cavalli on 1/1/26.
//

import SwiftUI
import CoreData
struct IssueView: View {
    @ObservedObject var issue: Issue
    @EnvironmentObject var dataController: DataController
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    TextField("Title", text: $issue.issueTitle, prompt: Text("Enter the issue title here."))
                        .font(Font.title)
                    Text("**Modified:** \(issue.issueModificationDate.formatted(date: .long, time: .shortened))")
                        .foregroundStyle(.secondary)
                    Text("**Status:** \(issue.issueStatus)")
                        .foregroundStyle(.secondary)
                }
                Picker("Priority", selection: $issue.priority) {
                    Text("Low").tag(Int16(0))
                    Text("Medium").tag(Int16(1))
                    Text("High").tag(Int16(2))
                }
                Menu {
                    // show selected tags first
                    ForEach(issue.issueTags) { tag in
                        Button {
                            issue.removeFromTags(tag)
                        } label: {
                            Label(tag.tagName, systemImage: "checkmark")
                        }
                    }
                    let otherTags =  dataController.missingTags(from: issue)
                    if otherTags.isEmpty == false {
                        Divider()
                        Section("Add Tags") {
                            ForEach(otherTags) { tag in
                                Button(tag.tagName) {
                                    issue.addToTags(tag)
                                }
                            }
                        }
                    }
                } label: {
                    Text(issue.issueTagsList)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .animation(nil, value: issue.issueTagsList)
                }
            }
            Section {
                VStack(alignment: .leading) {
                    Text("Basic Information")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    TextField("Description", text: $issue.issueContent, prompt: Text("Enter the issue description here."))
                }
            }
        }
        .disabled(issue.isDeleted)
        .onReceive(issue.objectWillChange) { _ in
            dataController.queueSave()
        }
    }
}
