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
    
    private init(){
        
    }
    
    let fobias = [
        Fobia(type: "Aranhas", backgroundIcon: UIImage(named: "cardSpider")!, icon: UIImage(named: "aranhaIcon")!),
        Fobia(type: "Agulhas", backgroundIcon: UIImage(named: "needleCard")!, icon: UIImage(named: "agulhaIcon")!),
        Fobia(type: "Cobras", backgroundIcon: UIImage(named: "snakeCard")!, icon: UIImage(named: "snakeIcon")!),
        Fobia(type: "Sapos", backgroundIcon: UIImage(named: "frogCard")!, icon: UIImage(named: "frogIcon")!)
    ]
    
    let fobiasInfo = [
        PhobiaInfo(title: "Vamos conhecer dados científicos?", description: "Aranhas são top elas são legais, vamos falar sobre aranhinhas lalala hihihi hohoh aranhas aracnofobicas"),
        PhobiaInfo(title: "Você sabe o que elas fazem?", description: "Fazem coisas de aranha não se meta"),
        
    ]
    
}
