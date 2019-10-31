//
//  Model.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 16/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation
import UIKit

class Model {
    static let shared = Model()
    var fobiaSelecionada: Int
    var fobias = [Fobia]()
    
    private init() {
        
        fobias.append(
            Fobia(
            tipoFobia: .aranha,
            backgroundIcon: UIImage(named: "cardSpider")!,
            icon: UIImage(named: "aranhaIcon")!,
            title: "Vamos conhecer dados científicos?",
            description: "Aranhas são top elas são legais, vamos falar sobre aranhinhas lalala hihihi hohoh aranhas aracnofobicas",
            audios: [
            ]
        ))
        fobias.append(
            Fobia(
            tipoFobia: .agulha,
            backgroundIcon: UIImage(named: "needleCard")!,
            icon: UIImage(named: "agulhaIcon")!,
            title: "Vamos conhecer dados científicos?",
            description: "Aranhas são top elas são legais, vamos falar sobre aranhinhas lalala hihihi hohoh aranhas aracnofobicas",
            audios: [
            ]
        ))
        fobias.append(
            Fobia(
            tipoFobia: .cobra,
            backgroundIcon: UIImage(named: "snakeCard")!,
            icon: UIImage(named: "snakeIcon")!,
            title: "Vamos conhecer dados científicos?",
            description: "Aranhas são top elas são legais, vamos falar sobre aranhinhas lalala hihihi hohoh aranhas aracnofobicas",
            audios: [
            ]
        ))
        fobias.append(
            Fobia(
                  tipoFobia: .sapo,
                  backgroundIcon: UIImage(named: "frogCard")!,
                  icon: UIImage(named: "frogIcon")!,
                  title: "Vamos conhecer dados científicos?",
                  description: "Aranhas são top elas são legais, vamos falar sobre aranhinhas lalala hihihi hohoh aranhas aracnofobicas",
                  audios: [
                  ]
              ))
    }

}


