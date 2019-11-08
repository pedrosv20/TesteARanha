//
//  ChooseVoiceViewController.swift
//  TesteARanha
//
//  Created by Vinícius Binder on 07/11/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class ChooseVoiceViewController: UIViewController {
    
    @IBOutlet weak var sexControl: UISegmentedControl!
    @IBOutlet var languageButtons: [UIButton]!
    var selectedPhobiaIndex: Int!
    var selectedPhobia: Fobia {
          Model.shared.fobias[selectedPhobiaIndex]
    }
    var selectedButton = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Etapa Áudio"
        for button in languageButtons {
            button.layer.cornerRadius = 2
            button.adjustsImageWhenHighlighted = false
        }
        
        selectedButton = UserDefaults.standard.object(forKey: "selectedButton") as? Int ?? 0
        sexControl.selectedSegmentIndex = UserDefaults.standard.object(forKey: "selectedSex") as? Int ?? 0
        
        updateSelection()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if self.isMovingToParent {
            parent?.viewWillAppear(true)
        }
    }
    
    @IBAction func usPressed(_ sender: Any) {
        selectedButton = 0
        updateSelection()
    }
    
    @IBAction func brPressed(_ sender: Any) {
        selectedButton = 1
        updateSelection()
    }
    
    @IBAction func frPressed(_ sender: Any) {
        selectedButton = 2
        updateSelection()
    }
    
    func updateSelection() {
        for button in languageButtons {
            button.layer.borderWidth = 0
        }
        
        let button = languageButtons[selectedButton].layer
        button.borderColor = #colorLiteral(red: 0.9383394122, green: 0.9172338843, blue: 0.6741884947, alpha: 1)
        button.borderWidth = 5
        
        UserDefaults.standard.set(selectedButton, forKey: "selectedButton")
    }
    
    @IBAction func sexChanged(_ sender: Any) {
        
        UserDefaults.standard.set(sexControl.selectedSegmentIndex, forKey: "selectedSex")
    }
    
    @IBAction func next(_ sender: Any) {
        
        var audioType = AudioType.F_EN
        
        if (selectedButton == 0) {
            if (sexControl.selectedSegmentIndex == 0) {
                audioType = AudioType.F_EN
            } else {
                audioType = AudioType.M_EN
            }
        } else if (selectedButton == 1) {
            if (sexControl.selectedSegmentIndex == 0) {
                audioType = AudioType.F_BR
            } else {
                audioType = AudioType.M_BR
            }
        }
        
        selectedPhobia.changeAudio(audio: audioType)
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "audio") as? Nivel2ViewController {
            vc.selectedPhobiaIndex = selectedPhobiaIndex
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
