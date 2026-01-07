//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Thomas Cavalli on 12/29/25.
//
// added to GitHub 12/30/2025
// added  5. Cleaning up Core Data on 1/1/2026.
// added  6. Showing, deleting, and synchronizing issues on 1/1/2026.
// added  7. Editing items on 1/1/2026
// added  8. Instant sync and save on 1/2/2026
// added  9. Filtering issues on 1/2/2026
// added 10. Advanced filtering and sorting on 1/3/2026
// added 12. Adding issues and tags on 1/4/2026
// added 13. Reading awards JSON on 1/5/2026
// added 14. Earning awards on 1/6/2026
// added 15. Finishing our initial version on 1/6/2026
// read  16. Now for the real work on 1/6/2026
// added 17. Making your app accessible on 1/6/2026
import SwiftUI
import CoreData

@main
struct UltimatePortfolioApp: App {
    @StateObject var dataController = DataController()
    @Environment(\.scenePhase) var scenePhase
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
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase != .active {
                    dataController.save()
                }
            }
        }
    }
}
