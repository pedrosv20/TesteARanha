//
//  ProgressViewController.swift
//  TesteARanha
//
//  Created by Vinícius Binder on 25/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import WatchConnectivity

class ProgressViewController: UIViewController {

    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var start1: UILabel!
    @IBOutlet weak var pike1: UILabel!
    @IBOutlet weak var end1: UILabel!
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var start2: UILabel!
    @IBOutlet weak var pike2: UILabel!
    @IBOutlet weak var end2: UILabel!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var time3: UILabel!
    @IBOutlet weak var start3: UILabel!
    @IBOutlet weak var pike3: UILabel!
    @IBOutlet weak var end3: UILabel!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var time4: UILabel!
    @IBOutlet weak var start4: UILabel!
    @IBOutlet weak var pike4: UILabel!
    @IBOutlet weak var end4: UILabel!
    @IBOutlet weak var view4: UIView!
    
    var progresso = Model.shared.progresso
    
    var session: WCSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Progresso"
        
        view1.layer.cornerRadius = 10.0
        view2.layer.cornerRadius = 10.0
        view3.layer.cornerRadius = 10.0
        view4.layer.cornerRadius = 10.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (!WCSession.isSupported() || session == nil) {
            print("nao tem apple watch saia daqui")
            
            let alert = UIAlertController(title: "Apple Watch", message: "Você precisa parear um Apple Watch a seu dispositivo para acessar essa sessão", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: {(_: UIAlertAction!) in
                                            self.navigationController?.popViewController(animated: true)

            }))
            
            self.present(alert, animated: true, completion: nil)
            
            //self.dismiss(animated: false, completion: nil)
        }
        
        
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
