//
//  TelaOnboarding1CollectionViewCell.swift
//  TesteARanha
//
//  Created by Pedro Vargas on 08/11/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class TelaOnboarding3CollectionViewCell: UICollectionViewCell {
    
    var index = 2
    
    @IBAction func touched(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("nextTouched"), object: nil, userInfo: ["tela" : index + 1])
    }
    
    @IBAction func backTouched(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("nextTouched"), object: nil, userInfo: ["tela" : index - 1])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        print(roundedIndex)
        }
    }

