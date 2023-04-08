//
//  iOS_Dev_Test_EZV_ErlinaApp.swift
//  iOS-Dev-Test-EZV-Erlina
//
//  Created by erlina ng on 07/04/23.
//

import SwiftUI

@main
struct iOS_Dev_Test_EZV_ErlinaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
