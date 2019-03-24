//
//  ViewController.swift
//  EmitterPOC
//
//  Created by Jamie Chu on 3/23/19.
//  Copyright © 2019 Jamie Chu. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var helloLabel: UILabel!
    @IBOutlet private weak var appreciationLabel: UILabel!
    @IBOutlet private weak var toggleButton: UIButton!
    @IBOutlet private weak var fuckLabel: UILabel!
    @IBOutlet private weak var uWuLabel: UILabel!
    @IBOutlet private weak var roundViewWIdth: NSLayoutConstraint!
    @IBOutlet private weak var roundView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(roundViewTapped))
            gesture.numberOfTapsRequired = 1
            roundView.addGestureRecognizer(gesture)
            roundView.layer.cornerRadius = 22
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
            emitBasketBalls()
    }

    // MARK: - Helpers
    lazy var winkLabels: [UILabel] = { [fuckLabel, helloLabel, uWuLabel] }()
    
    private func winkHelloLabel() {
        UIView.animate(withDuration: 0.2, animations: {
            self.winkLabels.forEach { $0.transform = CGAffineTransform(scaleX: 1, y: 0.1) }
        }, completion: { _ in
            self.resetWinkLabels()
        })
    }
    
    private func resetWinkLabels() {
        UIView.animate(withDuration: 0.2) {
            self.winkLabels.forEach { $0.transform = .identity }
        }
    }
    
    private func emitBasketBalls() {
        //  this is a layer that will be added into the emitter layer
        let emitter = Emitter.get(with: #imageLiteral(resourceName: "basketball"))
        // we want it at the center of the view
        emitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 0)
        view.layer.addSublayer(emitter)
    }
    
    @IBAction private func didPressToggleButton(_ sender: UIButton) {
        winkHelloLabel()
    }

    @objc private func roundViewTapped() {
        let isLarge = roundViewWIdth.constant > 45

        roundViewWIdth.constant = isLarge
            ? 44
            : view.frame.width - 32
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

