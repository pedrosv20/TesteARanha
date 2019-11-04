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
    
    override func viewDidDisappear(_ animated: Bool) {
        parent?.viewWillAppear(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Etapa Imagem"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedPhobia.cardsThree.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagemCell", for: indexPath) as! ImagemCell

        cell.titleLabel.text = selectedPhobia.cardsThree[indexPath.row].title
        cell.subTitleLabel.text = selectedPhobia.cardsThree[indexPath.row].description
        cell.cardImage.image = selectedPhobia.cardsThree[indexPath.row].image
        
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


