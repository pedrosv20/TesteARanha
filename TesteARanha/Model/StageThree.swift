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
    
    internal init(
        title: String,
        description: String,
        image: String
    ) {
        self.title = title
        self.description = description
        self.image = UIImage(named: image) ?? UIImage(named: "frogIcon.png")!
    }
    
}
