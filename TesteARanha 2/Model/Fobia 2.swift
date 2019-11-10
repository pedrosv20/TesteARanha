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
    var tipoFobia: TipoFobia
    var icon: UIImage
    var cardsOne: [StageOne]
    var cardsTwo: [StageTwo]
    var cardsThree: [StageThree]
    
    internal init(
        tipoFobia: TipoFobia,
        icon: UIImage,
        stageOne: [StageOne],
        stageTwo: [StageTwo],
        stageThree: [StageThree]
    ) {
        self.tipoFobia = tipoFobia
        self.icon = icon
        self.cardsOne = stageOne
        self.cardsTwo = stageTwo
        self.cardsThree = stageThree
    }
}

enum TipoFobia: String {
    case aranha = "Aranhas"
    case agulha = "Agulhas"
    case cobra = "Cobras"
    case sapo = "Sapos"
}

