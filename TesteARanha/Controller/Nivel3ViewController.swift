//
//  Nivel3ViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 30/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import CoreImage
import WatchConnectivity

class Nivel3ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var pageControl: UIPageControl!
    
    var selectedPhobiaIndex: Int!
    var selectedPhobia: Fobia {
        Model.shared.fobias[selectedPhobiaIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Etapa Imagem"
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = selectedPhobia.cardsThree.count
        pageControl.numberOfPages = count
        pageControl.pageIndicatorTintColor = UIColor(red:0.14, green:0.27, blue:0.40, alpha:1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        pageControl.isHidden = !(count > 1)
        
        return count
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        parent?.viewWillAppear(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagemCell", for: indexPath) as! ImagemCell
        let fobia = selectedPhobia.cardsThree[indexPath.row]

        cell.titleLabel.text = fobia.title
        cell.subTitleLabel.text = fobia.description
        cell.cardImage.image = fobia.image
        
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


