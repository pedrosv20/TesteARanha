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
    
    func blur() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }

    func unBlur() {
        for subview in self.subviews {
            if subview is UIVisualEffectView {
                UIView.animate(withDuration: 1.5, animations: {
                    subview.alpha = 0
                }) { (Bool) in
                    subview.removeFromSuperview()
                }
            
            }
        }
    }
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
}
