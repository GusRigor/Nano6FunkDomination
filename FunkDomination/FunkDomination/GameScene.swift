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
    var coefGanhoSeguidoresTempo = 0.01
    var valorPzz = 20.0
    var valorFa = 20.0
    
    var timer = TimeInterval.init(10000000)
    
    let labelButton = SKLabelNode(text: "")
    
    let imageDinheiro = SKSpriteNode(imageNamed: "dindin")
    let imageFundoDinheiro = SKSpriteNode(color: .white, size: .init(width: 330, height: 100))
    let labelDinheiro = SKLabelNode(text: "0")
    
    let imageSeguidores = SKSpriteNode(imageNamed: "pessoa")
    let imageFundoSeguidores = SKSpriteNode(color: .white, size: .init(width: 330, height: 100))
    let labelSeguidores = SKLabelNode(text: "0")
    
    let imageUpdateFundoVerdeFa = SKSpriteNode(color: .init(cgColor: #colorLiteral(red: 0.7137254902, green: 0.862745098, blue: 0.1529411765, alpha: 1)), size: .init(width: 330, height: 75))
    let imageTaxaFundoBrancoFa = SKSpriteNode(color: .white, size: .init(width: 330, height: 75))
    let labelTaxaFa = SKLabelNode(text: "0 / h")
    let labelUpdateFa = SKLabelNode(text: "$0.0")
    let imageUpdateFa = SKSpriteNode(texture: .init(image: .init(systemName: "arrow.up")!))
    let imageUpdateSeguidores = SKSpriteNode(imageNamed: "pessoa")
    
    let imageUpdateFundoVerdePzz = SKSpriteNode(color: .init(cgColor: #colorLiteral(red: 0.7137254902, green: 0.862745098, blue: 0.1529411765, alpha: 1)), size: .init(width: 330, height: 75))
    let imageTaxaFundoBrancoPzz = SKSpriteNode(color: .white, size: .init(width: 330, height: 75))
    let labelTaxaPzz = SKLabelNode(text: "0 / h")
    let labelUpdatePzz = SKLabelNode(text: "$0.0")
    let imageUpdatePzz = SKSpriteNode(texture: .init(image: .init(systemName: "arrow.up")!))
    let imageUpdateDinheiro = SKSpriteNode(imageNamed: "dindin")
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        labelUpdateFa.text = "$\(retornarFormatado(valorFa))"
        labelUpdatePzz.text = "$\(retornarFormatado(valorPzz))"
        labelTaxaFa.text = "\(retornarFormatado(numSeguidores*coefGanhoSeguidores)) / h"
        labelTaxaPzz.text = "\(retornarFormatado(numDinheiro*coefGanhoDinheiro)) / h"
        
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: 750, height: 1334)
        background.zPosition = -100
        addChild(background)
        
        labelButton.fontSize = 45
        labelButton.verticalAlignmentMode = .center
        labelButton.fontColor = .white
        
        labelDinheiro.fontSize = 50
        labelDinheiro.verticalAlignmentMode = .center
        labelDinheiro.fontColor = .black
        imageDinheiro.size = CGSize(width: 50, height: 50)
        
        labelSeguidores.fontSize = 50
        labelSeguidores.verticalAlignmentMode = .center
        labelSeguidores.fontColor = .black
        imageSeguidores.size = CGSize(width: 50, height: 50)
        
        let playerNode = SKSpriteNode(imageNamed: "1_Prancheta 1")
        playerNode.position = CGPoint(x: 0, y: 0)
        playerNode.size = CGSize(width: playerNode.size.width/5, height: playerNode.size.height/5)
        
        playerStateMachine = GKStateMachine(states: [
            PlayerIdle(playerNode: playerNode)
        ])
        
        let button = SKButtonNode(image: playerNode, label: labelButton, action: {
            self.numSeguidores += 1 * self.coefGanhoSeguidores
            self.labelTaxaPzz.text = "\(self.retornarFormatado(self.numSeguidores*self.coefGanhoDinheiro)) / h"
            self.labelSeguidores.text = "\(self.retornarFormatado(self.numSeguidores))"
        })
        
        let labelDinheiroCustom = SKLabelTelaInicial(fundo: self.imageFundoDinheiro, label: self.labelDinheiro, imagem: self.imageDinheiro)
        let labelSeguidoresCustom = SKLabelTelaInicial(fundo: self.imageFundoSeguidores, label: self.labelSeguidores, imagem: self.imageSeguidores)
        
        let buttonUpdateCustomFa = SKButtonUpdateNode(fundoBranco: self.imageTaxaFundoBrancoFa, fundoVerde: self.imageUpdateFundoVerdeFa, labelTaxa: self.labelTaxaFa, labelUpdate: self.labelUpdateFa, imagemTaxa: self.imageUpdateSeguidores, imagemUpdate: self.imageUpdateFa, position: .init(x: -90, y: -235), action: {
            if self.numDinheiro >= self.valorFa{
                
                self.numDinheiro -= self.valorFa
                self.valorFa += self.valorFa*0.8
                self.coefGanhoSeguidoresTempo += 0.02
                
                self.labelSeguidores.text = "\(self.retornarFormatado(self.numSeguidores))"
                self.labelUpdateFa.text = "$\(self.retornarFormatado(self.valorFa))"
                self.labelTaxaFa.text = "\(self.retornarFormatado(self.numSeguidores*self.coefGanhoSeguidoresTempo)) / h"
                
            }
        })
        
        let buttonUpdateCustomPzz = SKButtonUpdateNode(fundoBranco: self.imageTaxaFundoBrancoPzz, fundoVerde: self.imageUpdateFundoVerdePzz, labelTaxa: self.labelTaxaPzz, labelUpdate: self.labelUpdatePzz, imagemTaxa: self.imageUpdateDinheiro, imagemUpdate: self.imageUpdatePzz, position: .init(x: 90, y: -235), action: {
            if self.numDinheiro >= self.valorPzz{
                
                self.numDinheiro -= self.valorPzz
                self.valorPzz += self.valorPzz*0.8
                self.coefGanhoDinheiro += 0.2
                
                self.labelDinheiro.text = "\(self.retornarFormatado(self.numDinheiro))"
                self.labelUpdatePzz.text = "$\(self.retornarFormatado(self.valorPzz))"
                self.labelTaxaPzz.text = "\(self.retornarFormatado(self.numSeguidores*self.coefGanhoDinheiro)) / h"
                
            }
        })
        
        button.position = CGPoint(x: 0, y: 0)
        
        labelDinheiroCustom.position = CGPoint(x: 180, y: 500)
        labelSeguidoresCustom.position = CGPoint(x: -180, y: 500)
        
        self.addChild(button)
        self.addChild(labelDinheiroCustom)
        self.addChild(labelSeguidoresCustom)
        
        self.addChild(buttonUpdateCustomFa)
        self.addChild(buttonUpdateCustomPzz)
        
        playerStateMachine?.enter(PlayerIdle.self)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if timer > currentTime  {
            timer = currentTime
        }
        if (currentTime - timer) >= 1{
            self.numDinheiro += self.numSeguidores * self.coefGanhoDinheiro
            self.numSeguidores += self.numSeguidores * self.coefGanhoSeguidoresTempo
            self.labelDinheiro.text = "\(retornarFormatado(numDinheiro))"
            self.labelSeguidores.text = "\(retornarFormatado(numSeguidores))"
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
