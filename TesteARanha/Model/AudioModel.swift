//
//  AudioModel.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation


class AudioModel {
    static let shared = AudioModel()
    
    private init() {
        
    }
    
    let audios = [
        AudioFobia(text: "OOOOOOSJSKDJKJ", audio: "SDJKSAJDKLSAD"),
        AudioFobia(text: "SKDJKLSAJDSA", audio: "SLDKL;SAKD;LSAD"),
        AudioFobia(text: "sdsldkals;kda;slk", audio: "sdl;ksa;ldksal;d")
    ]
    
}
