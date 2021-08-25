//
//  SKLabelMenu.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 25/08/21.
//

import Foundation
import SpriteKit

class SKLabelMenuNode: SKNode{
    var fundo : SKSpriteNode?
    var label : SKLabelNode?
    var action : (()-> Void)?
    
    init(_ label : String, position: CGPoint, action: @escaping () -> Void, color fundoCor:UIColor = .white) {
        super.init()
        
        self.action = action
        self.fundo = SKSpriteNode(color: fundoCor, size: .init(width: 650, height: 100))
        self.label = SKLabelNode(text: label)
        self.label?.fontSize = 45
        self.label?.verticalAlignmentMode = .center
        self.label?.fontColor = .black
        fundo?.position = position
        
        self.isUserInteractionEnabled = true
        
        fundo?.addChild(self.label!)
        addChild(fundo!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action?()
    }
    
}
