//
//  Pokemon.swift
//  PokeapiDex
//
//  Created by Brent Schooley on 8/3/16.
//  Copyright © 2016 Twilio. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Pokemon {
    let name: String
    var types: [String?]? = []
    let spriteUrl: String?
    
    init(json: JSON) throws {
        name = json["name"].stringValue.capitalizedString
        
        types?.append(json["types"][1]["type"]["name"].string)
        types?.append(json["types"][0]["type"]["name"].string)
        
        spriteUrl = json["sprites","front_default"].string?.stringByReplacingOccurrencesOfString("http", withString: "https")
    }
}
