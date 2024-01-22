//
//  ViewController.swift
//  CocoapodsPractice
//
//  Created by Chorrs on 10.01.24.
//

import UIKit
import Jelly
import LTMorphingLabel

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationOfLabelToAnimate(
            frameX: 100,
            frameY: 100,
            width: 200,
            height: 200
        )
    }

    @IBAction func moveToVC() {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC")
        let slidePresentation = SlidePresentation(direction: .top)
        let animator = Animator(presentation: slidePresentation)
        animator.prepare(presentedViewController: viewController)
        present(viewController, animated: true, completion: nil)
    }
    
    func configurationOfLabelToAnimate(
        frameX: Double,
        frameY: Double,
        width: Double,
        height: Double
    ) {
        let label = LTMorphingLabel(frame: CGRect(
            x: frameX,
            y: frameY,
            width: width,
            height: height)
        )
        
        label.text = "Hello, world"
        view.addSubview(label)
        
        NSLayoutConstraint.activate(
            [view.centerXAnchor.constraint(equalTo: label.centerXAnchor, constant: 0),
             view.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 0)]
        )
        view.layoutIfNeeded()
        label.morphingEffect = .anvil
        label.morphingEnabled = true
        label.morphingDuration = 3
        label.morphingCharacterDelay = 0.5
        label.start()
    }
}

