//
//  HubDocument.swift
//  SyncHub
//
//  Created by Steven Liu on 2/1/26.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var hubEditDocument = UTType(exportedAs: "com.gtiosclub.SyncHub.hub")
}

struct HubEditDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.hubEditDocument] }

    var text = ""

    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}

extension HubEditDocument {
    init(initialText: String = "") {
        self.text = initialText
    }
}
