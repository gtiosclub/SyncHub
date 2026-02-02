//
//  HomeView.swift
//  SyncHub
//
//  Created by Steven Liu on 2/1/26.
//

import SwiftUI

#if os(iOS)
struct iOSLaunchScene: Scene {
    var body: some Scene {
        DocumentGroupLaunchScene {
            NewDocumentButton("Start a new hub")
        } background: {
            Image(.pinkJungle)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } overlayAccessoryView: { geometry in
            AccessoryView(geometry: geometry)
        }
    }
}

private struct AccessoryView: View {
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
