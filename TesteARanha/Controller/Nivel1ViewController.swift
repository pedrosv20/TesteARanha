//
//  Nivel1ViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class Nivel1ViewController: UIViewController {

    
    @IBOutlet weak var boardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.boardImageView.layer.masksToBounds = true
        self.boardImageView.layer.cornerRadius = self.boardImageView.frame.width/9.0

    }
    

}
