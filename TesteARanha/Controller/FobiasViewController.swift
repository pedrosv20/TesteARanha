//
//  FobiasViewController.swift
//  TesteARanha
//
//  Created by Maria Fernanda Azolin on 15/10/19.
//  Copyright © 2019 Pedro Vargas. All rights reserved.
//

import UIKit

class FobiasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var phobiasTableView: UITableView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
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
        
        cell.cardLabel.text = fobia.tipoFobia.rawValue
        cell.cardIcon.image = fobia.icon
        cell.cardBackground.image = fobia.backgroundIcon
        cell.cardBackground.layer.masksToBounds = true
        cell.cardBackground.layer.cornerRadius = cell.cardBackground.frame.width/19.0
        cell.tipoFobia = fobia.tipoFobia
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Model.shared.fobiaSelecionada = indexPath.row
        if let vc = storyboard?.instantiateViewController(withIdentifier: "niveis") as? NiveisViewController {
            vc.selectedPhobiaIndex = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    
}

extension Dictionary where Key: ExpressibleByStringLiteral {
    func getValue<T: RawRepresentable>(forKey key: T) -> Value? where T.RawValue == String {
        return self[key.rawValue as! Key]
    }
    mutating func setValue<T: RawRepresentable>(value: Value, forKey key: T) where T.RawValue == String {
        self[key.rawValue as! Key] = value
    }
}
