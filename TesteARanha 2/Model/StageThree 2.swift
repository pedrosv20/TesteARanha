//
//  StageThree.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 01/11/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation
import UIKit

class StageThree {
    var title: String
    var description: String
    var image: UIImage
    var isBlurred: Bool
    
    internal init(
        title: String,
        description: String,
        image: String,
        isBlurred: Bool
    ) {
        self.title = title
        self.description = description
        self.image = UIImage(named: image) ?? UIImage(named: "frogIcon.png")!
        self.isBlurred = isBlurred
    }
    
}
