//
//  FobiasViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class FobiasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var phobiasTableView: UITableView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        phobiasTableView?.delegate = self
        phobiasTableView?.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fobiaCell", for: indexPath) as! FobiaCell
        
        cell.phobiaLabel.text = "ARANHAS"
        cell.backgroundImage.image = UIImage(named: "spidersBackground")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "niveis") as? NiveisViewController {
            vc.selectedPhobia = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    
}
