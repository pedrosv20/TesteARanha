//
//  Fobia.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 16/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation
import UIKit

class Fobia {
    
    internal init(type: String, backgroundIcon: UIImage, icon: UIImage) {
        self.type = type
        self.backgroundIcon = backgroundIcon
        self.icon = icon
        
    }
    
    var type: String
    var backgroundIcon: UIImage
    var icon: UIImage

    
}
