//
//  Produto.swift
//  inchallenge
//
//  Created by José Eduardo Vieira Morango on 7/19/16.
//  Copyright © 2016 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import UIKit


class Produto{
    //Representa o schema no JSON
    static let JSON_PRODUCT = "products"

    //Representa os atributos no JSON
    static let ID = "id"
    static let DESC = "desc"
    static let IMAGE = "image"
    static let LAST_PRICE = "last_price"
    static let LAST_PRICE_RAW = "last_price_raw"
    static let LINK = "link"
    static let NAME = "name"
    static let PRICE = "price"
    static let PRICE_RAW = "price_raw"
    static let RATING = "rating"
    
    //Atributos
    var id: Int
    var desc: String
    var image: UIImage!
    var image_link: NSURL
    var last_price: String
    var last_price_raw: Float
    var link: String
    var name: String
    var price: String
    var price_raw: Float
    var rating: Int

    
    init(dict : [String : AnyObject]){
        
        self.id             = (dict[Produto.ID] as! NSString).integerValue
        self.desc           = dict[Produto.DESC] as! String
        self.image_link     = NSURL(string: dict[Produto.IMAGE] as! String)!
        self.last_price     = dict[Produto.LAST_PRICE] as! String
        self.last_price_raw = dict[Produto.LAST_PRICE_RAW] as! Float
        self.link           = dict[Produto.LINK] as! String
        self.name           = dict[Produto.NAME] as! String
        self.price          = dict[Produto.PRICE] as! String
        self.price_raw      = dict[Produto.PRICE_RAW] as! Float
        self.rating         = (dict[Produto.RATING] as! NSString).integerValue
    
        
        
        
        
        
        
    }
  
    
    func getOfertaTachada() -> NSAttributedString!{
    
        let tachada = NSMutableAttributedString(string: self.last_price, attributes: [ NSStrikethroughStyleAttributeName : 1])
        
        let normal = NSMutableAttributedString(string: " por " + self.price)

        tachada.appendAttributedString(normal)
        return tachada
        
    }
    
    
    
    static func produtoGenerator(dict : [String : AnyObject] ) -> [Produto]{
        
        
        // Obtém o schema de produtos e o converte para um Array de dicionários
        let productDict = dict[Produto.JSON_PRODUCT] as! [ [String : AnyObject] ]
        
        // Transforma todos os dicionários em Produtos e em seguida faz ordenação pelo Id.
        let produtos : [Produto] = productDict.map{  Produto(dict: $0 )  }.sort{ $0.0.id < $0.1.id }
        
        return produtos
    
    
    }

}