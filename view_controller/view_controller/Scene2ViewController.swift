//
//  Scene2ViewController.swift
//  view_controller
//
//  Created by Kaiya Renee Wahl on 9/30/21.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userAuthor: UITextField!
    @IBOutlet weak var userBook: UITextField!
    
    override func viewDidLoad() {
        userBook.delegate = self
        userAuthor.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneFav"{
            let scene1VC = segue.destination as! ViewController
            if userAuthor.text?.isEmpty == false{
                scene1VC.user.favAuthor = userAuthor.text
            }
            if userBook.text?.isEmpty == false{
                scene1VC.user.favBook = userBook.text
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
