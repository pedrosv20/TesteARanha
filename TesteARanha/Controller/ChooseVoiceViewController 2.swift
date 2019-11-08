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
    var selectedButton = 0
    var wentFurther = false

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Etapa Áudio"
        for button in languageButtons {
            button.layer.cornerRadius = 2
            button.adjustsImageWhenHighlighted = false
        }
        //selectedButton = USER DEFAULTS
        updateSelection()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if wentFurther {
            
        } else {
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
        
        //save in user defaults
    }
    
    @IBAction func sexChanged(_ sender: Any) {
        
        // save in user defaults
    }
    
    @IBAction func next(_ sender: Any) {
        
        // choose audio
        
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
