//
//  AudioFobia.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import AVFoundation
import UIKit

class Audio: NSObject {
    private var player: AVAudioPlayer!
    private var text: String
    
    init(fileName: String, text: String, audio: String) {
        self.text = text
        
        super.init()
        self.player = load(fileName)
        
    }
    
    internal func load(_ fileName: String) -> AVAudioPlayer {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.numberOfLoops = -1
            return player
        } catch {
            fatalError("The audio file was not found")
        }
    }
    
    func play() {
        if (player.isPlaying) {
            return
        }
        player.play()
    }
    
    func stop() {
        player.stop()
        player.currentTime = 0
    }
    
}

