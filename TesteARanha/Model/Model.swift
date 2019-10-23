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
    
    private init() {
        
    }
    
    let fobias = [
        Fobia(type: "ARANHAS", backgroundIcon: UIImage(named: "spidersBackground")!),
        Fobia(type: "SAPOS", backgroundIcon: UIImage(named: "frogsBackground")!),
        Fobia(type: "COBRAS", backgroundIcon: UIImage(named: "snakesBackground")!),
        Fobia(type: "RATOS", backgroundIcon: UIImage(named: "snakesBackground")!)
    ]
    
}
