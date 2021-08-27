//
//  SKButtonUpdate.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 27/08/21.
//

import SpriteKit

class SKButtonUpdateNode: SKNode{
    var fundoBranco : SKSpriteNode?
    var fundoVerde : SKSpriteNode?
    var labelTaxa : SKLabelNode?
    var labelUpdate : SKLabelNode?
    var imageTaxa : SKSpriteNode?
    var imageUpdate : SKSpriteNode?
    var action : (() -> Void)?
    
    init(fundoBranco: SKSpriteNode, fundoVerde: SKSpriteNode, labelTaxa : SKLabelNode, labelUpdate : SKLabelNode, imagemTaxa : SKSpriteNode, imagemUpdate : SKSpriteNode, position : CGPoint, action : @escaping ()->Void) {
        super.init()
        self.action = action
        self.isUserInteractionEnabled = true
        self.fundoBranco = fundoBranco
        self.fundoVerde = fundoVerde
        self.labelTaxa = labelTaxa
        self.labelUpdate = labelUpdate
        self.imageTaxa = imagemTaxa
        self.imageUpdate = imagemUpdate
        
        self.labelTaxa!.fontSize = 40
        self.labelTaxa!.verticalAlignmentMode = .center
        self.labelTaxa!.fontColor = .black
        
        self.labelUpdate!.fontSize = 40
        self.labelUpdate!.verticalAlignmentMode = .center
        self.labelUpdate!.fontColor = .black
        
        self.imageTaxa?.size = CGSize(width: 40, height: 40)
        self.imageUpdate?.size = CGSize(width: 40, height: 40)
        
        self.imageTaxa?.position = CGPoint(x: -120, y: 0)
        self.fundoBranco?.addChild(self.labelTaxa!)
        self.fundoBranco?.addChild(self.imageTaxa!)
        
        self.imageUpdate?.position = CGPoint(x: -120, y: 0)
        self.fundoVerde?.addChild(self.labelUpdate!)
        self.fundoVerde?.addChild(self.imageUpdate!)
        
        let mainNode = SKSpriteNode(color: .white, size: .init(width:  330, height: 150))
        mainNode.position = position
        self.fundoBranco?.position = CGPoint(x: 0, y: 37.5)
        self.fundoVerde?.position = CGPoint(x: 0, y: -37.5)
        mainNode.addChild(self.fundoBranco!)
        mainNode.addChild(self.fundoVerde!)
        
        let radiusShape = SKShapeNode.init(rect: CGRect.init(origin:.init(x: -mainNode.size.width/2, y: -mainNode.size.height/2), size:mainNode.size), cornerRadius: 15)
        radiusShape.position = mainNode.position
        radiusShape.lineWidth = 2.0
        radiusShape.fillColor = UIColor.red
        radiusShape.strokeColor = UIColor.red
        radiusShape.zPosition = -3
        radiusShape.position = mainNode.position
        let cropNode = SKCropNode()
        cropNode.position = mainNode.position
        cropNode.zPosition = -2
        cropNode.addChild(mainNode)
        cropNode.maskNode = radiusShape
        self.addChild(cropNode)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action?()
    }
}
