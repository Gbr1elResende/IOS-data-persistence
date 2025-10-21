//
//  MinhaMusicaAppApp.swift
//  MinhaMusicaApp
//
//  Created by COTEMIG on 21/10/25.
//

import SwiftUI

@main
struct MinhaMusicaAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
