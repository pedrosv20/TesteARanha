//
//  NiveisViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Wonder Woman. All rights reserved.
//

import UIKit

class NiveisViewController: UITableViewController {
    
    var selectedPhobia: Int!
    let cellSpacingHeight: CGFloat = 15
    var nameOfPhobia: String {
        Model.shared.fobias[selectedPhobia].type.lowercased()
    }
    var stages: [(name: String, icon: UIImage?, description: String)] {
        [
        (name: "Etapa Texto",
        icon: UIImage(named: "Etapa1Icon"),
        description: "Você vai acessar dados científicos sobre \(nameOfPhobia) numa abordagem de modo escrito."),
        (name: "Etapa Áudio",
        icon: UIImage(named: "Etapa2Icon"),
        description: "Você irá ouvir sobre \(nameOfPhobia). Será abordada em níveis. Vamos com calma."),
        (name: "Etapa Imagem",
        icon: UIImage(named: "Etapa3Icon"),
        description: "Você vai ver imagens de \(nameOfPhobia) em três níveis: desenho, cartoon e fotografia."),
        (name: "Etapa Realidade",
        icon: UIImage(named: "Etapa4Icon"),
        description: "Você vai usar a câmera para interagir com \(nameOfPhobia) via realidade aumentada.")
        ]
    }
    
    override func viewDidLoad() {
        navigationItem.title = Model.shared.fobias[selectedPhobia].type
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Settings"), style: .plain, target: self, action: #selector(callSettings(sender:)))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }
    
    @objc func callSettings(sender: UIBarButtonItem) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "settings") as? SettingsTableViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stages.count+1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == stages.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "viewProgressCell", for: indexPath) as! ViewProgressCell
            
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "etapaCell", for: indexPath) as! EtapaCell
            
            let content = stages[indexPath.row]
            cell.levelLabel.text = content.name
            cell.levelIcon.image = content.icon
            cell.levelIconBig.image = content.icon
            cell.levelDescription.text = content.description
            cell.levelView.dropShadow()
            cell.levelView.layer.masksToBounds = true
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var vc = UIViewController()
        if indexPath.row == 0 {
            vc = (storyboard?.instantiateViewController(withIdentifier: "texto") as! Nivel1ViewController)
        } else if indexPath.row == 1 {
            vc = storyboard?.instantiateViewController(withIdentifier: "audio") as! Nivel2ViewController
        } else if indexPath.row == 2 {
            vc = storyboard?.instantiateViewController(withIdentifier: "imagens") as! Nivel3ViewController
        } else if indexPath.row == 3 {
            vc = storyboard?.instantiateViewController(withIdentifier: "AR") as! Nivel4ViewController
        } else if indexPath.row == stages.count {
            vc = storyboard?.instantiateViewController(withIdentifier: "progress") as! ProgressViewController
        }
        
        if indexPath.row != stages.count {
            //vc.selectedPhobia = selectedPhobia
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// mask with shadow (animated when selecting)
// view progress only when touched directly onto the label/image
