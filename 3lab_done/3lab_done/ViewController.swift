//
//  ViewController.swift
//  3lab_done
//
//  Created by Kaiya Wahl on 9/20/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    
    func updateCaps(){
        if capitalSwitch.isOn {
            titleLabel.text = titleLabel.text?.uppercased()
            titleLabel.textColor = UIColor.green
        }
        else{
            titleLabel.text = titleLabel.text?.lowercased()
        }
    }
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
    }
    @IBAction func FontSize(_ sender: UISlider) {
        let fontSize = sender.value
        fontSizeLabel.text = String(format: "%.0f", fontSize)
        let fontSizeCGFloat = CGFloat(fontSize)
        titleLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex == 0 {
            titleLabel.text = "Snake Plant"
            plantImage.image = UIImage(named: "snake.jpg")
        }
        else if imageControl.selectedSegmentIndex == 1 {
            titleLabel.text = "Aloe Vera"
            plantImage.image = UIImage(named: "aloeVera.jpg")
        }
        updateCaps()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

