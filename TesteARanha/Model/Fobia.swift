//
//  Fobia.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 16/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import AVFoundation
import UIKit

class Fobia {
    
    var audios = [AVAudioPlayer]()
    var title: [String]
    var description: String
    var tipoFobia: TipoFobia
    var backgroundIcon: UIImage
    var icon: UIImage
    
    internal init(
        tipoFobia: TipoFobia,
        backgroundIcon: UIImage,
        icon: UIImage,
        title: [String],
        description: [String],
        audios: [String]
    ) {
        self.tipoFobia = tipoFobia
        self.backgroundIcon = backgroundIcon
        self.icon = icon
        self.title = title
        self.description = description
        
        
        for audio in audios {
            self.audios.append(AVAudioPlayer.load(audio))
        }
    }
}

enum TipoFobia: String {
    case aranha = "Aranhas"
    case agulha = "Agulhas"
    case cobra = "Cobras"
    case sapo = "Sapos"
}

