//
//  Nivel1ViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class Nivel1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedPhobiaIndex: Int!
    var selectedPhobia: Fobia {
        Model.shared.fobias[selectedPhobiaIndex]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        parent?.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Etapa Texto"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedPhobia.cardsOne.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "textoCell", for: indexPath) as! TextoCell
        
        cell.infoTitle.text = selectedPhobia.cardsOne[indexPath.row].text
        cell.infoDescription.text = selectedPhobia.cardsOne[indexPath.row].title
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.width/17.0
        
        return cell
    }

}
