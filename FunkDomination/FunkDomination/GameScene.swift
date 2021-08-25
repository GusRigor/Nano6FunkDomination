//
//  GameScene.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 24/08/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
     
     var menuOpen = false
    
     var numDinheiro = 0.0
     var numSeguidores = 0.0
     var coefGanhoDinheiro = 1.0
     var coefGanhoSeguidores = 1.0
     var timer = TimeInterval.init(10000000)

     
     let imageButton = SKSpriteNode(color: .blue, size: .init(width: 100, height: 100))
     let labelButton = SKLabelNode(text: "+")
     let labelDinheiro = SKLabelNode(text: "0")
     let labelSeguidores = SKLabelNode(text: "0")
     
     let imageMenuButton = SKSpriteNode(color: .blue, size: .init(width: 100, height: 100))
     let labelMenuButton = SKLabelNode(text: "Menu")
     
     let imageMenuCloseButton = SKSpriteNode(color: .black, size: .init(width: 100, height: 100))
     let labelMenuCloseButton = SKLabelNode(text: "X")
     
     
     let menu = SKSpriteNode(color: .green, size: .init(width: 600, height: 600))
     
     
     override func sceneDidLoad() {
          super.sceneDidLoad()
          menu.position = CGPoint(x: 0, y: 0)
          menu.isHidden = true
        
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
        
          let button = SKButtonNode(image: imageButton, label: labelButton, action: {
               self.numSeguidores += 1 * self.coefGanhoSeguidores
               self.labelSeguidores.text = "\(self.numSeguidores)"
          })
          
          let buttonClose = SKButtonNode(image: self.imageMenuCloseButton, label: self.labelMenuCloseButton, action: {
               self.menu.isHidden = true
               self.menuOpen = false
          })
          
          let buttonMenu = SKButtonNode(image: imageMenuButton, label: labelMenuButton, action: {
               if !self.menuOpen{
                    buttonClose.position = CGPoint(x: 0, y: 0)
                    self.menu.isHidden = false
                    self.menuOpen = true
               }
          })
        
          button.position = CGPoint(x: 0, y: -500)
          buttonMenu.position = CGPoint(x: -200, y: -500)
          labelDinheiro.position = CGPoint(x: 300, y: 500)
          labelSeguidores.position = CGPoint(x: -300, y: 500)
          self.addChild(menu)
          menu.addChild(buttonClose)
          self.addChild(button)
          self.addChild(buttonMenu)
          self.addChild(labelDinheiro)
          self.addChild(labelSeguidores)
    }
     
     override func update(_ currentTime: TimeInterval) {
          if timer > currentTime  {
               timer = currentTime
          }
          if (currentTime - timer) >= 1{
               self.numDinheiro += self.numSeguidores * self.coefGanhoDinheiro
               self.labelDinheiro.text = "\(numDinheiro)"
               timer = currentTime
          }
     }
}
