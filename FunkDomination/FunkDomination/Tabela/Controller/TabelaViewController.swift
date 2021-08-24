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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UpgradeTableViewCell
        let upgrade = listaUpgrades[indexPath.row]
        cell.configCelula(upgrade: upgrade)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listaUpgrades[indexPath.row])
    }
    
}
