/*
    Created by Steven Liu on 2/1/26.

    Abstract:
        The main entry point into this app
*/

import SwiftUI
import Firebase
import FirebaseAuth
#if os(macOS)
import AppKit

#else
import UIKit
#endif

@main
struct SyncHubApp: App {
    #if os(macOS)
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    #else
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    #endif

    @State private var authProvider = AuthProvider.shared

    var body: some Scene {
        #if os(iOS)
        DocumentGroupLaunchScene {
            NewDocumentButton("New Canvas")
        } background: {
            Image(.pinkJungle)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } overlayAccessoryView: { geometry in
            AccessoryView(geometry: geometry)
        }
        #endif

        // MARK: a shared DocumentGroup scene that creates a nwe window for a canvas
        DocumentGroup(newDocument: CanvasDocument()) { file in
            CanvasView(canvas: file.$document)
                .environment(authProvider)
        }
    }
}

#if os(iOS)
struct AccessoryView: View {
    var geometry: DocumentLaunchGeometryProxy

    var body: some View {
        ZStack {
            Image(systemName: "square.3.layers.3d.top.filled")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.cyan, .purple)
                .font(.system(size: 100))
                .symbolEffect(.breathe, options: .repeat(.periodic(delay: 5.0)))
                .position(
                    x: geometry.titleViewFrame.minX,
                    y: geometry.titleViewFrame.maxY - 90
                )

            Image(.plant)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100)
                .position(
                    x: geometry.titleViewFrame.maxX,
                    y: geometry.titleViewFrame.maxY - 90
                )
        }
    }
}
#endif

