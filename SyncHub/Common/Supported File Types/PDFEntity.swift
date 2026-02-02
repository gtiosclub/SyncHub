//
//  PDFEntity.swift
//  SyncHub
//
//  Created by Steven Liu on 2/1/26.
//

import UniformTypeIdentifiers
import SwiftUI

// MARK: The type wrapping PDF files to be used in HubManagementRootView for frontend work

struct PDFEntity: HubEntity {
    static var supportedTypes: [UTType] = [.pdf]

    var displayName: String
    var data: Data
    var position: CGPoint
    var scale: CGFloat
}

// MARK: The type representing PDF files to be used in file transfer across apps
struct PDFRepresentation: Identifiable, Codable, Transferable {
    var id = UUID()
    var data: Data

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(importedContentType: .pdf) { data in
            PDFRepresentation(data: data)
        }
    }
}
