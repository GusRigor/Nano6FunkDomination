//
//  GameScene.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 24/08/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var playerStateMachine: GKStateMachine?
    
    var menuOpen = false
    
    var numDinheiro = 0.0
    var numSeguidores = 0.0
    var coefGanhoDinheiro = 1.0
    var coefGanhoSeguidores = 1.0
    var timer = TimeInterval.init(10000000)
    
    
//    let imageButton = SKSpriteNode(color: .blue, size: .init(width: 100, height: 100))
    let labelButton = SKLabelNode(text: "")
    let labelDinheiro = SKLabelNode(text: "$0")
    let labelSeguidores = SKLabelNode(text: "0")
    
    let imageMenuButton = SKSpriteNode(color: .blue, size: .init(width: 100, height: 100))
    let labelMenuButton = SKLabelNode(text: "Menu")
    
    let imageMenuCloseButton = SKSpriteNode(color: .black, size: .init(width: 100, height: 100))
    let labelMenuCloseButton = SKLabelNode(text: "X")
    
    
    let menu = SKSpriteNode(color: .green, size: .init(width: 650, height: 600))
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: 750, height: 1334)
        background.zPosition = -1
        addChild(background)
        
        menu.position = CGPoint(x: 0, y: 0)
        menu.isHidden = true
        menu.zPosition = 100
        
        labelButton.fontSize = 45
        labelButton.verticalAlignmentMode = .center
        labelButton.fontColor = .white
        
        labelDinheiro.fontSize = 50
        labelDinheiro.verticalAlignmentMode = .center
        labelDinheiro.fontColor = .white
        
        labelSeguidores.fontSize = 50
        labelSeguidores.verticalAlignmentMode = .center
        labelSeguidores.fontColor = .white
        
        labelMenuButton.fontSize = 40
        labelMenuButton.verticalAlignmentMode = .center
        labelMenuButton.fontColor = .white
        
        labelMenuCloseButton.fontSize = 50
        labelMenuCloseButton.verticalAlignmentMode = .center
        labelMenuCloseButton.fontColor = .white
        
        let playerNode = SKSpriteNode(imageNamed: "Warrior_Idle_1")
        playerNode.position = CGPoint(x: 0, y: 0)
        playerNode.size = CGSize(width: playerNode.size.width * 10, height: playerNode.size.height * 10)
        //self.addChild(playerNode)
        
        playerStateMachine = GKStateMachine(states: [
            PlayerIdle(playerNode: playerNode)
        ])
        
        let button = SKButtonNode(image: playerNode, label: labelButton, action: {
            self.numSeguidores += 1 * self.coefGanhoSeguidores
            self.labelSeguidores.text = "\(self.retornarFormatado(self.numSeguidores))"
        })
        
        let buttonClose = SKButtonNode(image: self.imageMenuCloseButton, label: self.labelMenuCloseButton, action: {
            self.menu.isHidden = true
            self.menuOpen = false
        })
        
        let buttonMenu = SKButtonNode(image: imageMenuButton, label: labelMenuButton, action: {
            if !self.menuOpen{
                buttonClose.position = CGPoint(x: 0, y: -250)
                self.menu.isHidden = false
                self.menuOpen = true
            }
        })
        
        let menuLabel = SKLabelMenuNode("Publicação nas redes sociais R$ 10", position: .init(x: 0, y: 300), action: {
            if self.numDinheiro > 10{
                self.numDinheiro -= 10
                self.coefGanhoSeguidores += 1
                self.labelDinheiro.text = "$\(self.retornarFormatado(self.numDinheiro))"
            }
        })
        
        button.position = CGPoint(x: 0, y: 0)
        buttonMenu.position = CGPoint(x: 0, y: -500)
        labelDinheiro.position = CGPoint(x: 300, y: 500)
        labelSeguidores.position = CGPoint(x: -300, y: 500)
        self.addChild(menu)
        menu.addChild(buttonClose)
        menu.addChild(menuLabel)
        self.addChild(button)
        self.addChild(buttonMenu)
        self.addChild(labelDinheiro)
        self.addChild(labelSeguidores)
        
        playerStateMachine?.enter(PlayerIdle.self)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if timer > currentTime  {
            timer = currentTime
        }
        if (currentTime - timer) >= 1{
            self.numDinheiro += self.numSeguidores * self.coefGanhoDinheiro
            self.labelDinheiro.text = "$\(retornarFormatado(numDinheiro))"
            timer = currentTime
        }
    }
    
    func retornarFormatado(_ num : Double) -> String{
        if num > 1000000000{
            return "\(String(format:"%.1f",num/1000000000))B"
        }else if num > 1000000{
            return "\(String(format:"%.1f",num/1000000))M"
        }else if num > 1000{
            return "\(String(format:"%.1f",num/1000))K"
        }else{
            return "\(Int(num))"
        }
    }
}
