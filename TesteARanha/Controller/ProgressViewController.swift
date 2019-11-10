//
//  ProgressViewController.swift
//  TesteARanha
//
//  Created by Vinícius Binder on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {

    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var start1: UILabel!
    @IBOutlet weak var pike1: UILabel!
    @IBOutlet weak var end1: UILabel!
    
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var start2: UILabel!
    @IBOutlet weak var pike2: UILabel!
    @IBOutlet weak var end2: UILabel!
    
    @IBOutlet weak var time3: UILabel!
    @IBOutlet weak var start3: UILabel!
    @IBOutlet weak var pike3: UILabel!
    @IBOutlet weak var end3: UILabel!
    
    @IBOutlet weak var time4: UILabel!
    @IBOutlet weak var start4: UILabel!
    @IBOutlet weak var pike4: UILabel!
    @IBOutlet weak var end4: UILabel!
    
    var progresso = Model.shared.progresso
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Progresso"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(Model.shared.progresso)
        
        start1.text = progresso["Nível 1"]![0].description
        start2.text = progresso["Nível 2"]![0].description
        start3.text = progresso["Nível 3"]![0].description
        start4.text = progresso["Nível 4"]![0].description
        
        pike1.text = progresso["Nível 1"]![1].description + "bpm"
        pike2.text = progresso["Nível 2"]![1].description + "bpm"
        pike3.text = progresso["Nível 3"]![1].description + "bpm"
        pike4.text = progresso["Nível 4"]![1].description + "bpm"
        
        end1.text = progresso["Nível 1"]![2].description + "bpm"
        end2.text = progresso["Nível 2"]![2].description + "bpm"
        end3.text = progresso["Nível 3"]![2].description + "bpm"
        end4.text = progresso["Nível 4"]![2].description + "bpm"
        
        time1.text = progresso["Nível 1"]![3].description + "bpm"
        time2.text = progresso["Nível 2"]![3].description + "bpm"
        time3.text = progresso["Nível 3"]![3].description + "bpm"
        time4.text = progresso["Nível 4"]![3].description + "bpm"
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
