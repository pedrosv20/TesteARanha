//
//  TelaOnboarding1CollectionViewCell.swift
//  TesteARanha
//
//  Created by Pedro Vargas on 08/11/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class TelaOnboarding5CollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    
    var index = 4
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func awakeFromNib() {
        self.nameTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func backTouched(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("nextTouched"), object: nil, userInfo: ["tela" : index - 1])
    }
    
    @IBAction func startApp(_ sender: Any) {
        if nameTextField.text != "" {
            Model.shared.setNome(nameTextField.text!)
            NotificationCenter.default.post(name: NSNotification.Name("start"), object: nil, userInfo: ["tela" : index])
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        print(roundedIndex)
        }
}

