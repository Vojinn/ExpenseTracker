//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Dusan Vojinovic on 26.2.23..
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TrasactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
