//
//  Nivel3ViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 30/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import CoreImage
import SpriteKit

class Nivel3ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    var selectedPhobiaIndex: Int!
      var selectedPhobia: Fobia {
          Model.shared.fobias[selectedPhobiaIndex]
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.shared.cardsEtapaImagem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagemCell", for: indexPath) as! ImagemCell

        cell.titleLabel.text = Model.shared.cardsEtapaImagem[indexPath.row].etapa3Title
        cell.subTitleLabel.text = Model.shared.cardsEtapaImagem[indexPath.row].etapa3SubTitle
        cell.cardImage.image = Model.shared.cardsEtapaImagem[indexPath.row].etapa3Imagem
        
        cell.cardImage.blur()
        cell.isBlurred = true
        cell.eyeImage.isHidden = false
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.width/17.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ImagemCell
        
        if cell.isBlurred {
            cell.cardImage.unBlur()
            cell.eyeImage.isHidden = true
            cell.isBlurred = false
        }
        else {
            cell.cardImage.blur()
            cell.eyeImage.isHidden = false
            cell.isBlurred = true
        }
        
    }


}

extension UIView {
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
}


