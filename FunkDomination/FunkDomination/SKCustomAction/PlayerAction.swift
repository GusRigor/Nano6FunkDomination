//
//  PlayerAction.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 26/08/21.
//

import SpriteKit
import GameKit

class PlayerIdle: GKState {
    ///Estado para a animação da personagem, criar uma estado para cada ação como pular e correr, se necessário.
    public var playerNode: SKSpriteNode
    
    init(playerNode: SKSpriteNode) {
        self.playerNode = playerNode
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        ///Executar a ação de dar tchau e abaixar o óculos.
        //Criar a animação para com pausa para a personagem executar uma ação
        let action = SKAction.sequence([SKAction.wait(forDuration: 1.5),SKAction.animate(with: .init(format: "%@_Prancheta 1", frameCount: 1...56), timePerFrame: 0.07), SKAction.wait(forDuration: .random(in: 2...5))])
        //rodar a animação criado repetindo para sempre
        playerNode.run(.repeatForever(action))
    }
}
