//
//  ViewController.swift
//  EmitterPOC
//
//  Created by Jamie Chu on 3/23/19.
//  Copyright © 2019 Jamie Chu. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var appreciationLabel: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.winkHelloLabel()
            self.emitBasketBalls()
        }
    }

    // MARK: - Helpers
    
    private func winkHelloLabel() {
        UIView.animate(withDuration: 0.2, animations: {
            self.helloLabel.transform = CGAffineTransform(scaleX: 1, y: 0.1)
        }, completion: { _ in
            self.resetWinkLabels()
        })
    }
    
    private func resetWinkLabels() {
        UIView.animate(withDuration: 0.2, animations: {
            self.helloLabel.transform = .identity
        }) { _ in
            print("-=- we will emit basketballs here")
        }
    }
    
    private func emitBasketBalls() {
        //  this is a layer that will be added into the emitter layer
//        let emitter = CAEmitterLayer()
        let emitter = Emitter.get(with: #imageLiteral(resourceName: "basketball"))
        // we want it at the center of the view
        emitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 0)
        view.layer.addSublayer(emitter)
        
        
    }
    
    @IBAction private func didPressToggleButton(_ sender: UIButton) {
        winkHelloLabel()
    }
}

