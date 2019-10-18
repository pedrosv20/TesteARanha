//
//  NiveisViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class NiveisViewController: UITableViewController {
    
    var selectedPhobia = 0
    
    override func viewWillAppear(_ animated: Bool) {
        loadViewIfNeeded()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "etapaCell", for: indexPath) as! EtapaCell
        
        switch indexPath.row {
        case 0:
            cell.levelLabel.text = "Etapa 1"
            cell.levelIcon.image = UIImage(named: "Etapa1Icon")
        case 1:
            cell.levelLabel.text = "Etapa 2"
            cell.levelIcon.image = UIImage(named: "Etapa2Icon")
        case 2:
            cell.levelLabel.text = "Etapa 3"
            cell.levelIcon.image = UIImage(named: "Etapa3Icon")
        case 3:
            cell.levelLabel.text = "Etapa 4"
            cell.levelIcon.image = UIImage(named: "Etapa4Icon")
        default:
            cell.levelLabel.text = "Etapa 1"
            cell.levelIcon.image = UIImage(named: "Etapa1Icon")
        }
    
        return cell
    }

    
}
