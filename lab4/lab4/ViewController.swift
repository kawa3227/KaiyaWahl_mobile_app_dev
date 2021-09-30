//
//  ViewController.swift
//  lab4
//
//  Created by Kaiya Wahl on 9/28/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var utilAmount: UITextField!
    @IBOutlet weak var rentAmount: UITextField!
    @IBOutlet weak var peopleLabel: UILabel!
    
    func updateTotals(){
        var rent:Float // rent ammount
        var util:Float
        
        if rentAmount.text!.isEmpty{
            rent = 0.0
        }else{
            rent = Float(rentAmount.text!)!
        }
        
        if utilAmount.text!.isEmpty{
            util = 0.0
        }else{
            util = Float(utilAmount.text!)!
        }
        
        let roommates = peopleStepper.value
        let total = rent + util
        var personTotal : Float = 0.0
        
        if roommates > 0 {
            personTotal = total / Float(roommates)
          //  print(personTotal)
        }else{
            let alert = UIAlertController(title: "Warning", message: "The number of people living in the house must at least one", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                self.peopleStepper.value = 1
                self.peopleLabel.text? = "Just me"
                self.updateTotals()
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        //format number into curreny
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        totalPerPerson.text = currencyFormatter.string(from: NSNumber(value: personTotal))
    }
    
    func textFieldShouldReturn( _ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing( _ textField: UITextField){
        updateTotals()
    }
    @IBAction func userTappedBackground(sender: AnyObject){
        view.endEditing(true)
        updateTotals()
    }
    @IBAction func updatePeople(_ sender: UIStepper) {
        
        if peopleStepper.value == 1 {
            peopleLabel.text = "Just me"
        }else{
            peopleLabel.text = String(format: "%.0f", peopleStepper.value) + " roommates"
        }
    }
    override func viewDidLoad() {
        rentAmount.delegate = self
        utilAmount.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

