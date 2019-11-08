//
//  AudioCell.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import AVFoundation
import UIKit

class AudioCell: UICollectionViewCell, AVAudioPlayerDelegate {
    
    var audio: AVAudioPlayer!
    var timer: Timer?
    var playing: Bool = false
    
    let pauseButton: UIImage? = UIImage(named: "pauserosa")
    let playButton: UIImage? = UIImage(named: "playrosa")
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var audioLbl: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // Play audio or stop audio depending on the player state
    @IBAction func playAudio(_ sender: Any) {
        // If the audio is already playing, the button will pause the audio.
        // Otherwise, it will play the audio and change its state to playing.
        //  TODO: change the button image when it's playing or paused
        if playing {
            audio.pause()
            button.setImage(playButton, for: UIControl.State.normal)
            playing = false
        } else {
            audio.play()
            slider.value = 0.0
            slider.maximumValue = Float(audio.duration)
            timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(self.updateSlider), userInfo: nil, repeats: true)
            button.setImage(pauseButton, for: .normal)
            playing = true
        }
    }
    
    // Controls the slider depending on the time
    @IBAction func sliderMoved(_ sender: UISlider) {
        audio.currentTime = TimeInterval(slider.value)
    }
    
    // Sets the audio
    func setAudioName(audio: AVAudioPlayer) {
        self.audio = audio
    }
    // Update the slider value
    @objc func updateSlider() {
        slider.value = Float(audio.currentTime)
        
        if slider.value == Float(audio.duration) {
            audio.stop()
        }
    }

    
}
