//
//  EtapaCell.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 18/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class EtapaCell: UITableViewCell {

    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelIcon: UIImageView!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var levelDescription: UILabel!
    @IBOutlet weak var levelIconBig: UIImageView!
    
    var cellColor = #colorLiteral(red: 0.8156862745, green: 0.4470588235, blue: 0.5176470588, alpha: 1)
    var selectionColor = UIColor.lightGray
    var isTheOneSelected: Bool = false
    
    func select() {
        UIView.animate(withDuration: 0.1, animations: {
            self.levelView.backgroundColor = self.selectionColor
        })
        isTheOneSelected = true
    }
    
    func unselect() {
        if isTheOneSelected {
            UIView.animate(withDuration: 0.8, animations: {
                self.levelView.backgroundColor = self.cellColor
            })
        }
        isTheOneSelected = false
    }
}
