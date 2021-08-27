//
//  PlayerAction.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 26/08/21.
//

import SpriteKit
import GameKit

class PlayerIdle: GKState {
    public var playerNode: SKSpriteNode
    
    init(playerNode: SKSpriteNode) {
        self.playerNode = playerNode
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        playerNode.run(.repeatForever(.animate(with: .init(format: "Warrior_Idle_%@", frameCount: 1...6), timePerFrame: 0.2)))
    }
}
