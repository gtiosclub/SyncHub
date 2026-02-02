//
//  SyncHubApp.swift
//  SyncHub
//
//  Created by Steven Liu on 1/31/26.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

@main
struct SyncHubApp: App {

    var body: some Scene {

        #if os(macOS)
        macOSLaunchScene()
        #endif

        #if os(iOS)
        iOSLaunchScene()
        #endif

        // MARK: a shared DocumentGroup scene that handles the management of a HubEditDocument instance
        DocumentGroup(newDocument: HubEditDocument()) { file in
            HubManagementRootView(document: file.$document)
        }

    }
}
