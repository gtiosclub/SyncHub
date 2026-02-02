//
//  HubEntity.swift
//  SyncHub
//
//  Created by Steven Liu on 2/1/26.
//

import SwiftUI
import UniformTypeIdentifiers

// MARK: The protocol to describe properties and behaviors of all concrete entity types
// MARK: Any concrete entity type a HubEditDocument supports must conform to this protocol

protocol HubEntity {
    static var supportedTypes: [UTType] { get }
    var displayName: String { get }
    var data: Data { get }

    init(displayName: String, data: Data)
}

extension HubEntity {
    init(data: Data) {
        self.init(displayName: "Untitled", data: data)
    }

    init(named: String = "Untitled") {
        self.init(displayName: named, data: Data())
    }
}

// MARK: A type-erasing wrapper for any concrete HubEntity type to be used in HubEditDocument
struct AnyHubEntity {
    let contentType: UTType
    var entity: any HubEntity

    private static var typeRegistry: [UTType: any HubEntity.Type] = [:]

    static func register<T: HubEntity>(_ type: T.Type) {
        for utType in type.supportedTypes {
            typeRegistry[utType] = type
        }
    }
}

extension AnyHubEntity: Codable {
    enum CodingKeys: String, CodingKey {
        case contentType
        case data
    }

    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try values.decode(UTType.self, forKey: .contentType)
        let data = try values.decode(Data.self, forKey: .data)

        guard let entityType = Self.typeRegistry[contentType] else {
            throw DecodingError.dataCorruptedError(
                forKey: .contentType,
                in: values,
                debugDescription: "No registered type for UTType: \(contentType)"
            )
        }

        self.entity = entityType.init(data: data)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(contentType, forKey: .contentType)
        try container.encode(entity.data, forKey: .data)
    }
}
