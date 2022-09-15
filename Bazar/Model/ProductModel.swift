//
//  ProductModel.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import Foundation
import ObjectMapper

class ProductModel: Mappable{
    var id: Int = 0
    var title: String = ""
    var price: Double = 0.0
    var image: String = ""
    var description: String = ""
    var category: String = ""
    var rating: [Rating] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id              <- map["id"]
        title           <- map["title"]
        price           <- map["price"]
        image           <- map["image"]
        description     <- map["description"]
        category        <- map["category"]
        rating          <- map["rating"]
    }
}

class Rating: Mappable{
    var rate: Double = 0.0
    var count: Int = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        rate              <- map["rate"]
        count           <- map["count"]
    }
}
