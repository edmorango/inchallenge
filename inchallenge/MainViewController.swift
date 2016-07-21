//
//  ViewController.swift
//  inchallenge
//
//  Created by José Eduardo Vieira Morango on 7/19/16.
//  Copyright © 2016 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit



class MainViewController: UITableViewController{

    //Produtos a serem exibidos na TableView
    var produtos : [Produto] = []
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //Altera a fonte da navigation bar
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name:"HelveticaNeue", size: 20)!]
    
        //Define os produtos a serem exibidos na TableView
        produtos = Produto.produtoGenerator(Parser.getDictFromJSON())
    
        
        
    }
    
    
    
    
    
    
    

    
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        
    // Retorna a célula "header" como cabeçalho
    return tableView.dequeueReusableCellWithIdentifier("header")! as UIView
        
        
}
    
    
    
    
    
    
   override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        // Define o título do cabeçalho
        return "Games para PS4"
        
    }
   

  override  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Define a quantidade de células que serão exibidas, utiliza o tamanho da lista de Produtos.
        return produtos.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        // Reaproveita a célula
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as! ProdutoTableViewCell
        // Obtém o índice do produto
        let index = indexPath.row
        
        
        let produto = produtos[index]
        
        // Define os valores da View
        cell.nome.text = produto.name
        
        cell.oferta.attributedText = produto.getOfertaTachada()
        
        //Função responsável por baixar e setar a imagem
        NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration()).dataTaskWithURL(produto.image_link, completionHandler: {
            (data, response , err) -> Void in
            
            produto.image = UIImage(data: data!)
            
            cell.imagem.image = produto.image
            
            
            
        }).resume()
        
        
        
        
        
        
        return cell
    }

    
    
    
        
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
            performSegueWithIdentifier("detail", sender: indexPath.row)
        
    }
        
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detail"{
        
       let detailViewController  =  segue.destinationViewController as! DetailViewController
         
        detailViewController.produto = produtos[ sender as! Int ]
            
        
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

