//
//  UIViewShadow.swift
//  TesteARanha
//
//  Created by Vinícius Binder on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset.height = 2
        layer.shadowOffset.width = 0
        layer.shadowRadius = 1.2
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func removeDropShadow(scale: Bool = true) {
        layer.shadowOpacity = 0
    }
}
