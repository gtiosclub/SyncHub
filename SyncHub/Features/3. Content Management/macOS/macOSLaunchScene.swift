//
//  macOSLaunchScene.swift
//  SyncHub
//
//  Created by Steven Liu on 2/7/26.
//

import SwiftUI

#if os(macOS)
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


    }
}

#Preview {
    macOSHomeView()
}
#endif
