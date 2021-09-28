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

