//
//  SyncHubApp.swift
//  SyncHub
//
//  Created by Steven Liu on 1/31/26.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

@main
struct SyncHubApp: App {
    var body: some Scene {
        DocumentGroup(editing: .itemDocument, migrationPlan: SyncHubMigrationPlan.self) {
            ContentView()
        }
    }
}

extension UTType {
    static var itemDocument: UTType {
        UTType(importedAs: "com.example.item-document")
    }
}

struct SyncHubMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        SyncHubVersionedSchema.self,
    ]

    static var stages: [MigrationStage] = [
        // Stages of migration between VersionedSchema, if required.
    ]
}

struct SyncHubVersionedSchema: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] = [
        Item.self,
    ]
}
