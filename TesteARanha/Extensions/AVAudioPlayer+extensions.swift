//
//  AVAudioPlayer+extensions.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 31/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import AVFoundation

extension AVAudioPlayer {
     static func load(_ fileName: String) -> AVAudioPlayer {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.numberOfLoops = 0
            return player
        } catch {
            fatalError("The audio file was not found")
        }
    }
}
