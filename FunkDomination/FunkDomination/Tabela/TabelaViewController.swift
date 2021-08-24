//
//  TabelaViewController.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 24/08/21.
//

import UIKit

class TabelaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var upgradeTableView: UITableView!
    @IBOutlet weak var tituloTabelLabel: UILabel!
    
    let listaUpgrades = UpgradeDAO().retornaTodosOsUpgrades()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upgradeTableView.dataSource = self
        upgradeTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaUpgrades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let upgrade = listaUpgrades[indexPath.row]
        cell.textLabel?.text = upgrade.titulo
        
        return cell
    }
    
}
