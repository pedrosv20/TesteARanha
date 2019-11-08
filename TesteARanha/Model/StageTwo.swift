//
//  StageTwo.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 01/11/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import AVFoundation

enum AudioType: String {
    case F_BR = "F_BR"
    case F_EN = "F_EN"
    case M_BR = "M_BR"
    case M_EN = "M_EN"
}

class StageTwo {
    var audioDescription: String
    var audio: AVAudioPlayer
    
    internal init(
        audioDescription: String,
        audio: String
    ) {
        self.audioDescription = audioDescription
        print(audio)
        self.audio = (AVAudioPlayer.load(audio))
    }
    
    func changeAudio(audio: AudioType, cardIndex: Int) {
        let audioName = "audio_" + String(describing: audio) + (cardIndex != 1 ? " " + cardIndex.description : "")
        self.audio = (AVAudioPlayer.load(audioName))
    }
}
