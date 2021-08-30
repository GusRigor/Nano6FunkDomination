//
//  GameViewController.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 24/08/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Carregar o arquivo com a cena do SpriteKit
            if let scene = SKScene(fileNamed: "GameScene") {
                // Ajusta o aspecto para a tela
                scene.scaleMode = .aspectFill
                
                // Apresenta a cena na tela (view)
                view.presentScene(scene)
            }
            
            //Carrega os objetos sem uma ordem, buscando otimização
            view.ignoresSiblingOrder = true
             
            //
//            view.showsFPS = true
//            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
