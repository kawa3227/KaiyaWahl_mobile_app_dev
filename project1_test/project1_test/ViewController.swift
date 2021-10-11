//
//  ViewController.swift
//  project1_test
//
//  Created by Kaiya Wahl on 9/27/21.
//
//sources: https://www.youtube.com/watch?v=XR_rTofgcxU
//https://www.youtube.com/watch?v=v9-xhPcxId4
//https://developer.apple.com/documentation/technologies
//mp3 downloads from https://www.epidemicsound.com/sound-effects/?tags=Fast&_us=adwords&_usx=11282646959_&gclid=Cj0KCQjwwY-LBhD6ARIsACvT72P-BJrU-Pj4hTEsJzk5sVU2Yces1QG8lF70ys-_aN1KlhrzHxsCsKYaAlkVEALw_wcB
import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var minStepper: UIStepper!
    @IBOutlet weak var timeCounter: UILabel!
    
    @IBAction func timerStepper(_ sender: UIStepper) {
        if minStepper.value == 1 {
            timeCounter.text = "1 minute"
        }
        else{
            timeCounter.text = String(format: "%.0f", minStepper.value) + " minutes"
        }
    }
    
    var OutTimer = Timer()
    var TimerDisplayer = 0
    @objc func Action(){
            //TimerDisplayer = Int(minStepper.value * 60)
            TimerDisplayer += 1
            Label.text = String(TimerDisplayer)
            if TimerDisplayer == Int(minStepper.value * 60){
                audioPlayer.stop()
               // Label.text = "Your meditation as ended"//replace wit alert
                let alert = UIAlertController(title: "Warning", message: "You mediation as ended", preferredStyle: UIAlertController.Style.alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(cancelAction)
                            
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                    self.OutTimer.invalidate()
                    self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    self.Label.text = "0"
                    self.minStepper.value = 1
                    self.audioPlayer.stop()
                    self.TimerDisplayer = 0
                            })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
  
    @IBAction func choose_background(_ sender: UIButton) {
        if sender.tag == 4 {
            self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
        else if sender.tag == 5 {
            self.view.backgroundColor = #colorLiteral(red: 0.659389317, green: 0.8405041099, blue: 1, alpha: 1)
        }
        else if sender.tag == 6 {
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        }
    }
    var audioPlayer = AVAudioPlayer()
    @IBAction func chooseSound(_ sender: UIButton) {
        if sender.tag == 0{
            let sound = Bundle.main.path(forResource: "Ocean", ofType: "mp3")
            do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode:AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.mixWithOthers])
            } catch {
            }
        }
        else if sender.tag == 1{
            let sound = Bundle.main.path(forResource: "Creek", ofType: "mp3")
            do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode:AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.mixWithOthers])
            } catch {
            }
        }
        else if sender.tag == 3 {
            let sound = Bundle.main.path(forResource: "Rain", ofType: "mp3")
            do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:sound!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode:AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.mixWithOthers])
            } catch {
            }
        }
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
        OutTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
}

