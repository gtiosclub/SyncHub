//
//  HomeView.swift
//  SyncHub
//
//  Created by Steven Liu on 2/1/26.
//

import SwiftUI

struct macOSLaunchScene: Scene {
    var body: some Scene {
        WindowGroup {
            macOSHomeView()
        }
    }
}

// MARK: macOS's HomeView that displays user's existing hubs

struct macOSHomeView: View {
    @Environment(\.newDocument) private var newDocument

    var body: some View {
        TabView {

        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("New Document") {
                    newDocument(HubEditDocument())
                }
            }
        }

    }
}

#Preview {
    macOSHomeView()
}
