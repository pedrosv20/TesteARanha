//
//  Nivel2ViewController.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class Nivel2ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedPhobiaIndex: Int!
    var selectedPhobia: Fobia {
          Model.shared.fobias[selectedPhobiaIndex]
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Etapa Áudio"
    }
    
    @objc func callSettings(sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "settings") as? SettingsTableViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = selectedPhobia.cardsTwo.count
        pageControl.numberOfPages = count
        pageControl.pageIndicatorTintColor = UIColor(red:0.78, green:0.77, blue:0.77, alpha:1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        pageControl.isHidden = !(count > 1)
        
        return count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "audioCell", for: indexPath) as! AudioCell
        
        let fobia = selectedPhobia.cardsTwo[indexPath.row]
        
        cell.audioLbl.text = fobia.audioDescription
        
        cell.textLbl.text = fobia.audioDescription
        
        cell.setAudioName(audio: fobia.audio)
        cell.slider.maximumTrackTintColor = UIColor.white
        cell.slider.minimumTrackTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        cell.slider.thumbTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.width/17.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        // Make sure that the number of items is worth the computing effort.
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout,
            let dataSourceCount = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: section),
            dataSourceCount > 0 else {
                return .zero
        }


        let cellCount = CGFloat(dataSourceCount)
        let itemSpacing = flowLayout.minimumInteritemSpacing
        let cellWidth = flowLayout.itemSize.width + itemSpacing
        var insets = flowLayout.sectionInset


        // Make sure to remove the last item spacing or it will
        // miscalculate the actual total width.
        let totalCellWidth = (cellWidth * cellCount) - itemSpacing
        let contentWidth = collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right


        // If the number of cells that exist take up less room than the
        // collection view width, then center the content with the appropriate insets.
        // Otherwise return the default layout inset.
        guard totalCellWidth < contentWidth else {
            return insets
        }


        // Calculate the right amount of padding to center the cells.
        let padding = (contentWidth - totalCellWidth) / 2.0
        insets.left = padding
        insets.right = padding
        return insets
    }
    
}
