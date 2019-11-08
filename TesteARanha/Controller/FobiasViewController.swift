//
//  FobiasViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit
import WatchConnectivity

class FobiasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        <#code#>
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        <#code#>
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        <#code#>
    }
    
    var session: WCSession?
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var phobiasTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        nameTextField.delegate = self
        
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
        
        updateText("Hillary")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if phobiasTableView != nil {
            phobiasTableView.reloadData()
            loadViewIfNeeded()
        }
        phobiasTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //tudo fica branco certinho e bonitinho
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
        if indexPath.row != 0 {
            return;
        }
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "niveis") as? NiveisViewController {
            vc.selectedPhobiaIndex = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let cell = tableView.cellForRow(at: indexPath) as! FobiaCell
        cell.select()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        return false
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateText(textField.text!)
    }
    
    func updateText(_ text: String) {
        nameTextField.text = "Olá, " + text
    }
}

//extension Dictionary where Key: ExpressibleByStringLiteral {
//    func getValue<T: RawRepresentable>(forKey key: T) -> Value? where T.RawValue == String {
//        return self[key.rawValue as! Key]
//    }
//    mutating func setValue<T: RawRepresentable>(value: Value, forKey key: T) where T.RawValue == String {
//        self[key.rawValue as! Key] = value
//    }
//}
