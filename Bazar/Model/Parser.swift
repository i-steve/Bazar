//
//  ProductMapper.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import Foundation
import ObjectMapper

class Parser{
    class func ParseProduct(apiResponse: AnyObject) -> [ProductModel]{
        
        let responseObj = Mapper<ProductModel>().mapArray(JSONArray: apiResponse as! [[String : Any]])
        return responseObj
        
    }
}
