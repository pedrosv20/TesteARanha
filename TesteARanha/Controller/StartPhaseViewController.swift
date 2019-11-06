//
//  StartPhaseViewController.swift
//  TesteARanha
//
//  Created by Vinícius Binder on 05/11/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class StartPhaseViewController: UIViewController {

    var selectedPhobiaIndex: Int!
    var selectedPhase: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedPhase == 0 {
            navigationItem.title = "Etapa Texto"
        } else if selectedPhase == 1 {
            navigationItem.title = "Etapa Áudio"
        } else if selectedPhase == 2 {
            navigationItem.title = "Etapa Imagem"
        } else if selectedPhase == 3 {
            navigationItem.title = "Etapa Realidade"
        }
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        if selectedPhase == 0 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "texto") as? Nivel1ViewController {
                vc.selectedPhobiaIndex = selectedPhobiaIndex
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else if selectedPhase == 1 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "audio") as? Nivel2ViewController {
                vc.selectedPhobiaIndex = selectedPhobiaIndex
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else if selectedPhase == 2 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "imagens") as? Nivel3ViewController {
                vc.selectedPhobiaIndex = selectedPhobiaIndex
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else if selectedPhase == 3 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "AR") as? Nivel4ViewController {
                vc.selectedPhobiaIndex = selectedPhobiaIndex
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
