//
//  GetingData.swift
//  Task
//
//  Created by LokeshReddy on 10/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import Foundation
struct DataToGet:Codable {
    let objectIDFieldName: String
        let globalIDFieldName, geometryType: String
        let features: [Feature]
    enum CodingKeys: String, CodingKey {
        case globalIDFieldName = "globalIdFieldName"
        case objectIDFieldName = "objectIdFieldName"
     
        case features,geometryType
    }
}
struct Feature: Codable {
   let attributes: Attributes
}
struct Attributes: Codable {
    let cases7Per100K: Double
    let rs: String

    enum CodingKeys: String, CodingKey {
        case cases7Per100K = "cases7_per_100k"
        case rs = "RS"
    }
}
