//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Thomas Cavalli on 12/29/25.
//
// added to GitHub 12/30/2025
// added this message 12/31/2025 as a GitHub Push test.

import SwiftUI
import CoreData

@main
struct UltimatePortfolioApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView()
            } content: {
                ContentView()
            } detail:  {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
        }
    }
}
