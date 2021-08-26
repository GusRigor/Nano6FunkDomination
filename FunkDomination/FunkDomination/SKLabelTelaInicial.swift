//
//  SKLabelTelaInicial.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 26/08/21.
//

import SpriteKit

class SKLabelTelaInicial: SKNode {
    var fundo : SKSpriteNode?
    var label : SKLabelNode?
    var imagem : SKSpriteNode?
    
    init(fundo:SKSpriteNode, label:SKLabelNode, imagem:SKSpriteNode) {
        super.init()
        self.fundo = fundo
        self.label = label
        self.imagem = imagem
        self.imagem?.position = CGPoint(x: -120, y: 0)
        self.fundo?.addChild(self.imagem!)
        self.fundo?.addChild(label)
        self.isUserInteractionEnabled = true
        
        let radiusShape = SKShapeNode.init(rect: CGRect.init(origin:.init(x: -fundo.size.width/2, y: -fundo.size.height/2), size:fundo.size), cornerRadius: 10)
        radiusShape.position = fundo.position
        radiusShape.lineWidth = 2.0
        radiusShape.fillColor = UIColor.red
        radiusShape.strokeColor = UIColor.red
        radiusShape.zPosition = -3
        radiusShape.position = fundo.position
        let cropNode = SKCropNode()
        cropNode.position = fundo.position
        cropNode.zPosition = -2
        cropNode.addChild(self.fundo!)
        cropNode.maskNode = radiusShape
        self.addChild(cropNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
