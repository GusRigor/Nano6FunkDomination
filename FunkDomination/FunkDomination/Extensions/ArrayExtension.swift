//
//  ArrayExtension.swift
//  FunkDomination
//
//  Created by Gustavo Rigor on 26/08/21.
//

import Foundation
import SpriteKit

extension Array where Element == SKTexture{
    init(format: String, frameCount: ClosedRange<Int>) {
        ///Inicialização para adicionar várias imagem a uma animação passando o padrão do arquivo e seus números
        self = frameCount.map({ i in
            let imageName = String(format: format, "\(i)")
            return SKTexture(imageNamed: imageName)
        })
    }
}
