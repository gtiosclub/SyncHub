//
//  ContentView.swift
//  SyncHub
//
//  Created by Steven Liu on 1/31/26.
//

import SwiftUI
import SwiftData

struct HubManagementRootView: View {
    @Binding var document: HubEditDocument
    
    var body: some View {
        Text("Hub management root view")
//        NavigationSplitView {
//            List {
//
//            }
//            #if os(macOS)
//            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
//            #endif
//            .toolbar {
//            #if os(iOS)
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//            #endif
//            }
//        } detail: {
//            Text("Select an item")
//        }
    }


}

#Preview {
    @Previewable @State var hubEditDocument = HubEditDocument()
    HubManagementRootView(document: $hubEditDocument)
}
