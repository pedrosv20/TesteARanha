//
//  OnBoardingViewController.swift
//  TesteARanha
//
//  Created by Leticia Pulner on 31/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import HealthKit

class OnBoardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cellIds = ["Onboarding1", "Onboarding2", "Onboarding3", "Onboarding4", "Onboarding5"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let healthStore = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UserDefaults.isFirstLaunch() {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "fobias") as? FobiasViewController {
                self.navigationController?.pushViewController(vc, animated: false)
            }
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(nextView), name: NSNotification.Name("nextTouched"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(backView), name: NSNotification.Name("backTouched"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(startApp), name: NSNotification.Name("start"), object: nil)
        
        
        title = "Phobits"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell( withReuseIdentifier: cellIds[indexPath.item], for: indexPath)
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellIds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.view.frame.width, height:self.view.frame.height)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)

        if roundedIndex == 4 {
            let typesToShare: Set = [
                HKQuantityType.workoutType()
            ]
            
            let typesToRead: Set = [
                HKQuantityType.quantityType(forIdentifier: .heartRate)!,
                HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
            ]
            
            healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
                // Handle error
                
            }
        }
    }
    
    @objc func nextView(_ notification: Notification) {
        if let page = notification.userInfo?["tela"] as? Int {
            collectionView.scrollToItem(at: IndexPath(row: page, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    @objc func backView(_ notification: Notification) {
        if let page = notification.userInfo?["tela"] as? Int {
            
            self.collectionView.scrollToItem(at: IndexPath(row: page, section: 0), at: .centeredHorizontally, animated: true)
        }
        
    }
    
    @objc func startApp(_ notification: Notification) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "fobias") as? FobiasViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
