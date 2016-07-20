//
//  DetailViewController.swift
//  inchallenge
//
//  Created by José Eduardo Vieira Morango on 7/20/16.
//  Copyright © 2016 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit



class DetailViewController: UITableViewController{

    var produto : Produto!
    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbOferta: UILabel!
    @IBOutlet weak var lbDescricao: UILabel!


    
   
    override func viewWillAppear(animated: Bool) {
        
        lbNome.text = produto.name
        lbDescricao.text = produto.desc
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func comprarAction(sender: AnyObject) {
    }


}