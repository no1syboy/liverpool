//
//  Mappers.swift
//  liverpool
//
//  Created by Erick Cienfuegos on 12/20/17.
//  Copyright © 2017 Erick Cienfuegos. All rights reserved.
//

import ObjectMapper
//$.contents[0].mainContent[1].contents[0].records[0].attributes['product.displayName']
/*
class SearchResponse: Mappable {
    var contents: [FistContent]?
    
    required init?(map: Map){
        // check if a required "records" property exists within the JSON.
        
    }
    
    func mapping(map: Map) {
        contents <- map["contents"]//$.contents[0].mainContent[1].contents[0].records
    }
}

class FistContent: Mappable {
    var records: [Record]?
    
    required init?(map: Map){
        // check if a required "records" property exists within the JSON.
        
    }
    
    func mapping(map: Map) {
        records <- map["records"]//$.contents[0].mainContent[1].contents[0].records
    }
}

class MainContent: Mappable {
    var records: [Record]?
    
    required init?(map: Map){
        // check if a required "records" property exists within the JSON.
        
    }
    
    func mapping(map: Map) {
        records <- map["records"]//$.contents[0].mainContent[1].contents[0].records
    }
}

class Content: Mappable {
    var records: [Record]?
    
    required init?(map: Map){
        // check if a required "records" property exists within the JSON.
        
    }
    
    func mapping(map: Map) {
        records <- map["records"]//$.contents[0].mainContent[1].contents[0].records
    }
}

/*class RecordsResponse: Mappable {
 var records: [Record]?
 
 required init?(map: Map){
 // check if a required "records" property exists within the JSON.
 if map.JSON["contents"] == nil {
 return nil
 }
 }
 
 func mapping(map: Map) {
 records <- map["contents.0.mainContent.1.contents.0.records"]//$.contents[0].mainContent[1].contents[0].records
 }
 }*/
class Record: Mappable {
    
    var clas: String?
    var detailsAction:  DetailsAction?
    var numRecords: String?
    var attributes: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        clas <- map["contents"]
        detailsAction <- map["detailsAction"]
        numRecords <- map["numRecords"]
        attributes <- map["attributes"]
    }
}

class Attributes: Mappable {
    var productSmallImage: String?
    var skuListPrice: String?
    var skuSmallImage: String?
    var productDisplayName: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        productSmallImage <- map["product.smallImage"]
        skuSmallImage <- map["sku.smallImage"]
        skuListPrice <- map["sku.list_Price"]
        productDisplayName <- map["product.displayName"]
    }
}

class DetailsAction: Mappable {
    var recordState: String?
    var contentPath: String?
    var clas: String?
    var siteRootPath: String?
    var label: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        recordState <- map["recordState"]
        contentPath <- map["contentPath"]
        clas <- map["@class"]
        siteRootPath <- map["siteRootPath"]
        label <- map["label"]
    }
}
*/
