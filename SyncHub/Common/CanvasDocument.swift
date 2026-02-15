/*
    Created by Steven Liu on 2/1/26.

    Abstract:
        The document type SyncHub uses to represent a canvas's content
*/

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var canvas = UTType(exportedAs: "com.gtiosclub.SyncHub.canvas")
}


/// Backing storage for a canvas
///   -  contains all content data stored in canvas
struct CanvasDocument: FileDocument {
    // Define the document type this app loads.
    static var readableContentTypes: [UTType] { [.canvas] }

    var content: String

    init(text: String = "") {
        self.content = text
    }

    // Load a file's contents into the document.
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            self.content = try JSONDecoder().decode(String.self, from: data)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }

    // Saves the document's data to a file.
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(content)
        return FileWrapper(regularFileWithContents: data)
    }
}

