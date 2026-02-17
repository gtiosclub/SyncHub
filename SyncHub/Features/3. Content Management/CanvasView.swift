/*
    Created by Steven Liu on 2/1/26.

    Abstract:
        - The entry point into a canvas
        - The root view for Content Management team
*/

import SwiftUI
import SwiftData
import UniformTypeIdentifiers
#if os(macOS)
import AppKit
#else
import UIKit
#endif

struct CanvasView: View {
    @Environment(AuthProvider.self) private var auth
    @Binding var canvas: CanvasDocument
    @FocusState private var isFocused: Bool

    var body: some View {
        @Bindable var auth = auth
        NavigationStack {
            ZStack {
                TextEditor(text: $canvas.content)
                    .font(.title)
                    .textEditorStyle(.plain)
                    .scrollIndicators(.never)
                    .onAppear {
                        self.isFocused = true
                    }
                    .focused($isFocused)
                    .padding()
            }
            .sheet(isPresented: Binding(
                get: { !auth.isSignedIn },
                set: { _ in }
            )) {
                AuthenticationView()
            }
        }
    }
}


#Preview {
    @Previewable @State var canvas = CanvasDocument()
    NavigationStack {
        CanvasView(canvas: $canvas)
            .navigationTitle("Canvas")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environment(AuthProvider.shared)
    }
}
