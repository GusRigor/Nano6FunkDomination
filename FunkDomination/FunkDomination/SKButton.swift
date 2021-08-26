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
        self.action?()
    }
    
}


extension SKSpriteNode {
    func addTo(parent:SKNode?, withRadius:CGFloat) {
        guard parent != nil else { return }
        guard  withRadius>0.0 else {
            parent!.addChild(self)
            return
        }
        let radiusShape = SKShapeNode.init(rect: CGRect.init(origin: parent!.position, size: size), cornerRadius: withRadius)
        radiusShape.position = parent!.position
        radiusShape.lineWidth = 2.0
        radiusShape.fillColor = UIColor.red
        radiusShape.strokeColor = UIColor.red
        radiusShape.zPosition = 2
        radiusShape.position = parent!.position
        let cropNode = SKCropNode()
        cropNode.position = self.position
        cropNode.zPosition = 3
        cropNode.addChild(self)
        cropNode.maskNode = radiusShape
        parent!.addChild(cropNode)
    }
}
