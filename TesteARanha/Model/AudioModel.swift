//
//  AudioModel.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import AVFoundation


class AudioModel {
    static let shared = AudioModel()
    
    var audios = [Audio: AudioFobia]()
    
    private init() {
        audios[.phaseOne] =
        
    }
    
    let audios = [
    
    ]
    
    func getAudio(_ audioToPlay: Audio) -> A {
        
    }
    
    func play(_ audioToPlay: Audio) {
        for (audio, audioFobia) in audios
        {
            if audio == audioToPlay {
                audioFobia.play()
            } else {
                audioFobia.stop()
            }
        }
    }
}

