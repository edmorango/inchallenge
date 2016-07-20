//
//  ViewController.swift
//  inchallenge
//
//  Created by José Eduardo Vieira Morango on 7/19/16.
//  Copyright © 2016 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit



class MainViewController: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //Altera a fonte da navigation bar
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name:"HelveticaNeue", size: 20)!]
    
        Produto.produtoGenerator(Parser.getDictFromJSON())
    
        
        
    }
    
    
    
    
    
    
    

    
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        
        // Define a célula "header" como cabeçalho
    let header = tableView.dequeueReusableCellWithIdentifier("header")! as UIView
        
        
    return header
        
}
    
    
    
    
    
    
   override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Games para PS4"
        
    }
   

  override  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return 5
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
     
        
        return cell
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

