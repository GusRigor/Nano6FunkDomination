//
//  Upgrade.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 24/08/21.
//

import Foundation

class Upgrade{
    var titulo : String
    var imageUrl : String
    var quantidadePessoas : Int
    
    init(_ titulo : String,Url imageUrl : String,pessoas quantidadePessoas: Int) {
        self.titulo = titulo
        self.imageUrl = imageUrl
        self.quantidadePessoas = quantidadePessoas
    }
    
}

class UpgradeDAO: NSObject{
    
    func retornaTodosOsUpgrades() -> Array<Upgrade> {
        let gravarStorie  = Upgrade("Gravar storie", Url: "", pessoas: 1)
        let publiFeed  = Upgrade("Fazer publicação no feed", Url: "", pessoas: 5)
        let boneCyclone  = Upgrade("Sortear Boné da cyclone", Url: "", pessoas: 50)
        let oakleyOculos  = Upgrade("Sortear óculos oakley", Url: "", pessoas: 100)
        let tiktoc  = Upgrade("Fazer TikVoc", Url: "", pessoas: 500)
        let trend  = Upgrade("Lançar trend", Url: "", pessoas: 1000)
        let convertMandraka = Upgrade("Converter pessoas em Mandraka", Url: "", pessoas: 5000)
        let praCima = Upgrade("Arraste para cima", Url: "", pessoas: 10000)
        let vrauTube = Upgrade("Canal no VrauTube", Url: "", pessoas: 50000)
        let clip = Upgrade("Lançar um clipe", Url: "", pessoas: 100000)
        let beat = Upgrade("Fazer um beat pesado", Url: "", pessoas: 250000)
        let casaEvento = Upgrade("Tocar na casa de evento" , Url: "", pessoas: 500000)
        let megatron = Upgrade("Contratar um Megatron", Url: "", pessoas: 1000000)
        let cidade = Upgrade("Show na cidade", Url: "", pessoas: 2000000)
        let estado = Upgrade("Show no estado", Url: "", pessoas: 5000000)
        let nacional = Upgrade("Show nacional", Url: "", pessoas: 10000000)
        let publi = Upgrade("Crescer no VrauTube", Url: "", pessoas: 20000000)
        let kondZilla = Upgrade("Fazer parceria com a KondZilla", Url: "", pessoas: 50000000)
        let pulaVanuza = Upgrade("Se apresentar no Pula Vanuzza", Url: "", pessoas: 100000000)
        let glockInRio = Upgrade("Se apresentar no Glock in Rio", Url: "", pessoas: 150000000)
        let fortCraft = Upgrade("Show no Forticraft", Url: "", pessoas: 200000000)
        let americaLatina = Upgrade("Show na América Latina", Url: "", pessoas: 500000000)
        let americaNorte = Upgrade("Show na América do Norte", Url: "", pessoas: 1000000000)
        let africa = Upgrade("Show na África", Url: "", pessoas: 1500000000)
        let oceania = Upgrade("Show na Oceania", Url: "", pessoas: 2000000000)
        let asia = Upgrade("Show na Ásia", Url: "", pessoas: 3000000000)
        let europa = Upgrade("Show na Europa", Url: "", pessoas: 5000000000)
        let espaco = Upgrade("Show na estação espacial", Url: "", pessoas: 7000000000)

        let listaUpgrades : Array<Upgrade> = [gravarStorie, publiFeed, boneCyclone, oakleyOculos, tiktoc, trend, convertMandraka, praCima, vrauTube, clip, beat, casaEvento, megatron, cidade, estado, nacional, publi, kondZilla, pulaVanuza, glockInRio, fortCraft, americaLatina, americaNorte, africa, oceania, asia, europa, espaco]
        
        return listaUpgrades
        
    }
}
