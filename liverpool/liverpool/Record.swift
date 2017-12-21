//
//  Record.swift
//  liverpool
//
//  Created by Erick Cienfuegos on 12/20/17.
//  Copyright © 2017 Erick Cienfuegos. All rights reserved.
//

import Foundation
import SwiftyJSON

class Record {
    
    var clas: String?
    var numRecords: NSNumber?
    var attributes: Attributes?
    
    required init?(json: JSON){
        clas = json["contents"].string
        numRecords = json["numRecords"].number
        attributes = Attributes(json: json["attributes"])
    }

}

class Attributes{
    var productSmallImage: String?
    var skuListPrice: String?
    var skuSmallImage: String?
    var productDisplayName: String?
    
    required init?(json: JSON){
        productSmallImage = json["product.smallImage"][0].string
        skuSmallImage = json["sku.smallImage"][0].string
        skuListPrice = json["sku.list_Price"][0].string
        productDisplayName = json["product.displayName"][0].string
    }

}
