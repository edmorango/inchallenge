//
//  Parser.swift
//  inchallenge
//
//  Created by José Eduardo Vieira Morango on 7/19/16.
//  Copyright © 2016 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation



class Parser{
    // Obtém o caminho do arquivo .JSON
    static let path = NSBundle.mainBundle().pathForResource("challenge", ofType:"json")!
    // Constante de resultados
    static let JSON_RESULT = "result"
    
    static func getDictFromJSON() -> [String : AnyObject] {
        
        //Obtém o arquivo
        let data = NSData(contentsOfFile: Parser.path)
        
        // Deserializa o Json
        let all = deserializeJSON(data!)
        
        // Garante que retorno nunca seja nulo
         guard let retorno = all[Parser.JSON_RESULT] as? [String: AnyObject] else{
        
            return [:]
       
        }

            return retorno
            
        
    
    }
    
    
    
    static func deserializeJSON(json: NSData) -> [String: AnyObject]{
        
        var dict: [String : AnyObject] = [:]
        
        do{
            //Transforma o arquvio Json em um dicionário.
            let dic = try NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.AllowFragments) as! [String: AnyObject]
            
            dict = dic
            
        }catch{
            
            print("Não foi possível desserializar o arquivo .JSON .")
            
        }
        
        return dict
        
    }
    
    
    


}