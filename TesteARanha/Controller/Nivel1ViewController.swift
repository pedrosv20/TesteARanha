//
//  Nivel1ViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import WatchConnectivity

class Nivel1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var selectedPhobiaIndex: Int!
    var selectedPhobia: Fobia {
        Model.shared.fobias[selectedPhobiaIndex]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        parent?.viewWillAppear(true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }
    
    var session: WCSession?
    
    override func viewDidLoad() {
        if (WCSession.isSupported()) {
            session = WCSession.default
            session!.delegate = self
            session!.activate()
        }
        
        super.viewDidLoad()
        navigationItem.title = "Etapa Texto"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = selectedPhobia.cardsOne.count
        pageControl.numberOfPages = count
        pageControl.pageIndicatorTintColor = UIColor(red:0.14, green:0.27, blue:0.40, alpha:1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        pageControl.isHidden = !(count > 1)
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "textoCell", for: indexPath) as! TextoCell
        
        let fobia = selectedPhobia.cardsOne[indexPath.row]
        
        cell.infoTitle.text = fobia.text
        cell.infoText.text = fobia.title
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.width/17.0
        
        return cell
    }

}
