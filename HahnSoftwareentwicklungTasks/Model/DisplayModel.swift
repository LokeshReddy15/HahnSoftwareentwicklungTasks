//
//  DisplayModel.swift
//  Task
//
//  Created by LokeshReddy on 09/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import Foundation
struct Display: Codable{
    
    let rs : Int
    
    let gen: String?
   enum CodingKeys: String, CodingKey {
       case rs = "RS"
       case gen = "GEN"
       
   }
}

