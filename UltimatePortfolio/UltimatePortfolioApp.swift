//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Thomas Cavalli on 12/29/25.
//
// added to GitHub 12/30/2025
// added 5. Cleaning up Core Data on 1/1/2026.
// added 6. Showing, deleting, and synchronizing issues on 1/1/2026.
// added 7. Editing items on 1/1/2026
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
