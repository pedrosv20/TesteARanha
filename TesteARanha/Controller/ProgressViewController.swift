//
//  ProgressViewController.swift
//  TesteARanha
//
//  Created by Vinícius Binder on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var soundView: UIView!
    @IBOutlet weak var imagesView: UIView!
    @IBOutlet weak var ARView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Progresso"
        
        topView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        textView.layer.cornerRadius = 25
        soundView.layer.cornerRadius = 25
        imagesView.layer.cornerRadius = 25
        ARView.layer.cornerRadius = 25
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
