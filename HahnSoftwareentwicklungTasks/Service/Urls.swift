//
//  Urls.swift
//  HahnSoftwareentwicklungTasks
//
//  Created by LokeshReddy on 18/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import Foundation
class Urls{
    let baseUrl = "https://services7.arcgis.com/mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query?"
    var getData:String{
        return "\(baseUrl)where=1%3D1&outFields=cases7_per_100k,RS&returnGeometry=false&outSR=06631&f=json"
    }
}
