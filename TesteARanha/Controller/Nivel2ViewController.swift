//
//  Nivel2ViewController.swift
//  TesteARanha
//
//  Created by Pyettra Ferreira on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import WatchConnectivity

class Nivel2ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectedPhobiaIndex: Int!
    var selectedPhobia: Fobia {
          Model.shared.fobias[selectedPhobiaIndex]
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var session: WCSession?
    
    override func viewDidLoad() {
        if (WCSession.isSupported()) {
            session = WCSession.default
            session!.delegate = self
            session!.activate()
            if session!.isPaired {
                Model.shared.appleWatch = true
            } else {
                Model.shared.appleWatch = false
            }
            
        }
        
        
        super.viewDidLoad()
        navigationItem.title = "Etapa Áudio"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for card in selectedPhobia.cardsTwo {
            card.audio.stop()
        }
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
        pageControl.pageIndicatorTintColor = UIColor(red:0.14, green:0.27, blue:0.40, alpha:1.0)
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
    
}
