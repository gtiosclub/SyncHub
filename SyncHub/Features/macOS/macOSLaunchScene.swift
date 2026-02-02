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
    var body: some View {
        TabView {

        }
    }
}

#Preview {
    macOSHomeView()
}
