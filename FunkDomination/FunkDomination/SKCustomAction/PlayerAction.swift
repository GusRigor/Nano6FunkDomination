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
        let action = SKAction.sequence([SKAction.wait(forDuration: 1.5),SKAction.animate(with: .init(format: "%@_Prancheta 1", frameCount: 1...56), timePerFrame: 0.07), SKAction.wait(forDuration: .random(in: 2...5))])
        playerNode.run(.repeatForever(action))
    }
}
