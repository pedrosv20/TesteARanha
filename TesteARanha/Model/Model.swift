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
        Fobia(type: "Aranhas", backgroundIcon: UIImage(named: "aranhaIcon")!, icon: UIImage(named: "aranhaIcon")!),
        Fobia(type: "Agulhas", backgroundIcon: UIImage(named: "aranhaIcon")!, icon: UIImage(named: "aranhaIcon")!),
        Fobia(type: "Cobras", backgroundIcon: UIImage(named: "aranhaIcon")!, icon: UIImage(named: "aranhaIcon")!),
        Fobia(type: "Sapos", backgroundIcon: UIImage(named: "aranhaIcon")!, icon: UIImage(named: "aranhaIcon")!)
    ]
    
}
