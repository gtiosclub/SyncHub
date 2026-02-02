//
//  PDFEntity.swift
//  SyncHub
//
//  Created by Steven Liu on 2/1/26.
//

import UniformTypeIdentifiers
import SwiftUI

struct PDFEntity: HubEntity {
    static var supportedTypes: [UTType] = [.pdf]
    var displayName: String
    var data: Data
}
