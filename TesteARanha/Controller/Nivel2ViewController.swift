//
//  Nivel2ViewController.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class Nivel2ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Etapa 2"

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = Model.shared.audios.count
        pageControl.numberOfPages = count
        pageControl.pageIndicatorTintColor = UIColor(red:0.78, green:0.77, blue:0.77, alpha:1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        pageControl.isHidden = !(count > 1)
        return Model.shared.audios.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "audioCell", for: indexPath) as! AudioCell
        
        cell.audioLbl.text = Model.shared.audios[indexPath.row].audio
        
        cell.textLbl.text = Model.shared.audios[indexPath.row].text
        
        cell.slider.maximumTrackTintColor = UIColor.white
        cell.slider.minimumTrackTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        cell.slider.thumbTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.width/17.0
        
        return cell
    }
}
