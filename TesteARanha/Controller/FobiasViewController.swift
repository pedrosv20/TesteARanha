//
//  FobiasViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import WatchConnectivity

class FobiasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phobiasTableView: UITableView!
    
    var session: WCSession?
    
    override func viewDidLoad() {
        if (WCSession.isSupported()) {
            session = WCSession.default
            session!.delegate = self
            session!.activate()
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        nameTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if phobiasTableView != nil {
            phobiasTableView.reloadData()
            loadViewIfNeeded()
        }
        
        phobiasTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //tudo fica branco certinho e bonitinho
        
        updateLabel(Model.shared.nomePessoa)
    }
    
    func reloadData() {
        phobiasTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.fobias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fobiaCell", for: indexPath) as! FobiaCell
        
        let fobia = Model.shared.fobias[indexPath.row]
        
        if indexPath.row != 0 {
            cell.selectionStyle = .none
            cell.lockCell()
        } else {
            cell.unlockCell()
            cell.unselect()
        }
        
        cell.cardLabel.text = fobia.tipoFobia.rawValue
        cell.cardIcon.image = fobia.icon
        cell.cardIconBig.image = fobia.icon
        cell.cardView.layer.masksToBounds = true
        cell.cardView.layer.cornerRadius = 15
        cell.tipoFobia = fobia.tipoFobia
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 || nameTextField.isEditing {
            return;
        }
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "niveis") as? NiveisViewController {
            
            vc.selectedPhobiaIndex = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let cell = tableView.cellForRow(at: indexPath) as! FobiaCell
        cell.select()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateLabel(textField.text!)
    }
    
    func updateLabel(_ text: String) {
        let text = text != "" ? text : "você!"
        nameTextField.text = "Olá, " + text
        Model.shared.setNome(text)
    }
}
