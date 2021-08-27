//
//  SKButton.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 25/08/21.
//

import Foundation
import SpriteKit

class SKButtonNode: SKNode{
    
    var image: SKSpriteNode?
    var label: SKLabelNode?
    var action: (()-> Void)?
    
    init(image: SKSpriteNode, label: SKLabelNode, action: @escaping () -> Void) {
        self.image = image
        self.label = label
        self.action = action
        super.init()
        self.isUserInteractionEnabled = true
        
        let radiusShape = SKShapeNode.init(rect: CGRect.init(origin:.init(x: -image.size.width/2, y: -image.size.height/2), size:image.size), cornerRadius: 10)
        radiusShape.position = image.position
        radiusShape.lineWidth = 2.0
        radiusShape.fillColor = UIColor.red
        radiusShape.strokeColor = UIColor.red
        radiusShape.zPosition = -3
        radiusShape.position = image.position
        let cropNode = SKCropNode()
        cropNode.position = image.position
        cropNode.zPosition = -2
        cropNode.addChild(self.image!)
        cropNode.maskNode = radiusShape
        self.addChild(cropNode)
        
        
        self.addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let particles = SKEmitterNode(fileNamed: "fire"), let location = touches.first?.location(in: self){
            particles.position = location
            addChild(particles)
            
            let removerAfterDead = SKAction.sequence([SKAction.wait(forDuration: 1.0), SKAction.removeFromParent()])
            particles.run(removerAfterDead)
        }
        self.action?()
    }
    
}
