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

    var content: DocumentContent

    var name: String { content.name }
    var entities: [AnyHubEntity] { content.entities }

    struct DocumentContent: Codable {
        var name: String = "Untitled"
        var entities: [AnyHubEntity] = []
    }

    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            self.content = try JSONDecoder().decode(DocumentContent.self, from: data)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(content)
        return FileWrapper(regularFileWithContents: data)
    }
}

extension HubEditDocument {
    init() {
        content = DocumentContent()
    }
}
