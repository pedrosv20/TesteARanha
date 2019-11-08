//
//  OnBoardingViewController.swift
//  TesteARanha
//
//  Created by Leticia Pulner on 31/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cellIds = ["Onboarding1", "Onboarding2", "Onboarding3", "Onboarding4", "Onboarding5"]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell( withReuseIdentifier: cellIds[indexPath.item], for: indexPath)
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellIds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:self.view.frame.width, height:self.view.frame.height)
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
