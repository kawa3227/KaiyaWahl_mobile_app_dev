//
//  ViewController.swift
//  view_controller
//
//  Created by Kaiya Renee Wahl on 9/30/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bookLabel: UILabel!
    
    var user = Favorite()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        bookLabel.text = user.favBook
        authorLabel.text = user.favAuthor
    }

}

