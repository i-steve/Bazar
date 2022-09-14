//
//  CartModel.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/13/22.
//

import Foundation

class CartModel{
    var title: String = ""
    var price: Double = 0.0
    var image: String = ""
}

class Cart{
    var cartArray = [CartModel()]
}
