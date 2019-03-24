//
//  Emitter.swift
//  EmitterPOC
//
//  Created by Jamie Chu on 3/23/19.
//  Copyright © 2019 Jamie Chu. All rights reserved.
//

import UIKit

enum Emitter {
    static func get(with image: UIImage) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell] {
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        // cell is pregnant but it needs to be born
        cell.birthRate = 1
        // we need to tell the cell how long it should live
        cell.lifetime = 50
        // we want the cells to move
        cell.velocity = 25
        // makes to generate and go to the down direction
        cell.emissionLongitude = asRadians(180)
        // allows you to define a code for a randomization of velocity
        cell.emissionRange = asRadians(45)
        cell.scaleRange = 0.3
        
        
        return [cell]
    }
    
    private var baseCell: CAEmitterCell {
        let cell = CAEmitterCell()
        
        return cell
    }
    
    private static func asRadians(_ degrees: CGFloat) -> CGFloat {
        return degrees * (.pi / 180)
    }
}

