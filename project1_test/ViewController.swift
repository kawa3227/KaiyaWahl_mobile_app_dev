//
//  ViewController.swift
//  project1_test
//
//  Created by Kaiya Wahl on 9/27/21.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var OutTimer = Timer()
    var TimerDisplayer = 0
    
    @IBOutlet weak var Label: UILabel!
 
    
    @objc func Action(){
        TimerDisplayer += 1
        Label.text = String(TimerDisplayer)
    }
    var audioPlayer = AVAudioPlayer()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let sound = Bundle.main.path(forResource: "Ocean", ofType: "mp3")
        do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound!))
        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode:AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.mixWithOthers])
        } catch {
            print(error)
        }


    }
    @IBAction func playButtonPressed(_ sender: UIButton) {
        audioPlayer.play()
        OutTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
   
}

//question 1 what are your intentions answers relax, release, energy, thought
// if user chooses relax change BG color to blue energy - yellow thought -purple release -orange
//quesition 2 what sounds would you like to listen to answers: creek, ocean, wind
//if user chooses creek play creek sounds
//question 3 how long would you like to meditate for
//if user says 3 minutes
//set max to 3 mintues or 180 seconds and have time give an alert when it reaches the max 
//each option for questions 1-2 will be their own button with their own actions 
