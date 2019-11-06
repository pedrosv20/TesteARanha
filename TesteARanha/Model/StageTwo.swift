//
//  StageTwo.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 01/11/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import AVFoundation

class StageTwo {
    var audioDescription: String
    var audio: AVAudioPlayer
    
    internal init(
        audioDescription: String,
        audio: String
    ) {
        self.audioDescription = audioDescription
        self.audio = (AVAudioPlayer.load(audio))
    }
    
}
