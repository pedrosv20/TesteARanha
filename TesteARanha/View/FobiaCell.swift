//
//  FobiaCell.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 16/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class FobiaCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardIcon: UIImageView!
    @IBOutlet weak var cardIconBig: UIImageView!
    var tipoFobia: TipoFobia!
    
    var cellColor = #colorLiteral(red: 0.9383394122, green: 0.9172338843, blue: 0.6741884947, alpha: 1)
    var selectionColor = UIColor.lightGray
    var isTheOneSelected: Bool = false
    
    func select() {
        UIView.animate(withDuration: 0.1, animations: {
            self.cardView.backgroundColor = self.selectionColor
        })
        isTheOneSelected = true
    }
    
    func unselect() {
        if isTheOneSelected {
            UIView.animate(withDuration: 0.8, animations: {
                self.cardView.backgroundColor = self.cellColor
            })
        }
        isTheOneSelected = false
    }
}
