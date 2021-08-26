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
        self = frameCount.map({ i in
            let imageName = String(format: format, "\(i)")
            return SKTexture(imageNamed: imageName)
        })
    }
}
