//
//  ViewController.swift
//  EggTimer
//
//  Created by Jafz

import UIKit
import AVFoundation//Audio visual foundation library

class ViewController: UIViewController {
    
    //creating a new AVAudioPlayer
    var player = AVAudioPlayer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    //Dictionary
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    //5 min = 300 seconds
    //7  min = 420 seconds
    //12  min = 720 seconds
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate() //stop the timer when you click on a new button
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        totalTime = eggTimes[hardness]! //total time is based on the hardness that is selected
        progressBar.progress = 0.0 //resetting the progress bar after tapping a new button
        secondsPassed = 0 //resetting the seconds passed
        titleLabel.text = hardness //set the text back
        //timer code
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer (){
        if secondsPassed < totalTime {
            secondsPassed += 1
            //code for progress bar
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }else {
            timer.invalidate()
            titleLabel.text = "DONE!" //change the text to done,when the egg is done.
            //to play sound
            //change these 2:forResource: "name of the music file", withExtension: "format"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        
    }
    
    
    
    
}

