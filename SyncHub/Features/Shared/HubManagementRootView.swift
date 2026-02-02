//
//  ContentView.swift
//  SyncHub
//
//  Created by Steven Liu on 1/31/26.
//

import SwiftUI
import SwiftData

// MARK: The root view (i.e. canvas) to present and manipulate all content related to a canvas

struct HubManagementRootView: View {
    @Binding var document: HubEditDocument

    @State private var pdf: PDFEntity?

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Rectangle()
                        .overlay {
                            if let _ = pdf {
                                Text("received pdf")
                            } else {
                                Text("Empty")
                            }
                        }
                        .frame(width: 200, height: 300)
                        .dropDestination(for: PDFRepresentation.self) { items,session in
                            if let pdfData = items.first {
                                pdf = PDFEntity(data: pdfData.data)
                                return true
                            }
                            return false
                        }
                    Text("Drag a PDF file here")
                }
            }
            .navigationTitle("Hub Management Root View")
        }
    }


}

#Preview {
    @Previewable @State var hubEditDocument = HubEditDocument()
    NavigationStack {
        HubManagementRootView(document: $hubEditDocument)
            .navigationTitle("Hub Management Root View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
