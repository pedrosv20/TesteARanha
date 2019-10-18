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
    
    override func viewWillAppear(_ animated: Bool) {
        if phobiasTableView != nil {
            phobiasTableView.reloadData()
            loadViewIfNeeded()
        }
        phobiasTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //tudo fica branco certinho e bonitinho
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.fobias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fobiaCell", for: indexPath) as! FobiaCell
        
        cell.phobiaLabel.text = Model.shared.fobias[indexPath.row].type
        cell.backgroundImage.image = Model.shared.fobias[indexPath.row].backgroundIcon
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "niveis") as? NiveisViewController {
            vc.selectedPhobia = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    
}
