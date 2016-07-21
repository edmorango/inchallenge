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


    @IBOutlet weak var estrelas: Estrela!
   
    @IBOutlet weak var button: UIButton!
    
    
    override func viewWillAppear(animated: Bool) {
        
        button.layer.cornerRadius = button.frame.width * 0.05
        
        
        lbNome.text = produto.name
        lbDescricao.text = produto.desc
        lbOferta.attributedText = produto.getOfertaTachada()
         estrelas.number = produto.rating
        imagem.image = produto.image
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func comprarAction(sender: AnyObject) {
        
       UIApplication.sharedApplication().openURL(NSURL(string: produto.link)!)
    }


}