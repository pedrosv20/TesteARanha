//
//  Nivel1ViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class Nivel1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let fobias = Model.shared.fobias
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.shared.fobias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "textoCell", for: indexPath) as! TextoCell
        
        cell.infoTitle.text = fobias[indexPath.row].title
        cell.infoDescription.text = fobias[indexPath.row].description
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.width/17.0
        
        return cell
    }

}
