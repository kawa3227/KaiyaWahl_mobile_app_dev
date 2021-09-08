//
//  ViewController.swift
//  lab1
//
//  Created by Kaiya Renee Wahl on 9/8/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var changeText: UITextField!
    @IBOutlet weak var mtImage: UIImageView!
    
  
    @IBAction func pikes(_ sender: UIButton) {
        if sender.tag == 1{
            mtImage.image=UIImage(named:"pikes_peak")
            changeText.text = "Located in Colorado Springs Pikes Peak is 14,115ft tall"
            
        }
        else if sender.tag == 2{
            mtImage.image=UIImage(named:"long_peak")
            changeText.text = " Longs Peak is 14,259 ft tall"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

