//
//  UpgradeTableViewCell.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 24/08/21.
//

import UIKit

class UpgradeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var upgradeImage: UIImageView?
    @IBOutlet weak var tituloLabel: UILabel?
    @IBOutlet weak var nPessoasLabel: UILabel?
    
    func configCelula(upgrade: Upgrade){
        upgradeImage?.image = UIImage(named: upgrade.imageUrl != "" ? upgrade.imageUrl : "cadeado")
        tituloLabel?.text = upgrade.titulo
        nPessoasLabel?.text = upgrade.quantidadePessoas == 1 ? "\(upgrade.quantidadePessoas) pessoa"  : "\(upgrade.quantidadePessoas) pessoas" 
    }
    
}
