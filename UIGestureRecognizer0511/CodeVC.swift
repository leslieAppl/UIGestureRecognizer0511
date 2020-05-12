//
//  CodeVC.swift
//  UIGestureRecognizer0511
//
//  Created by leslie on 5/12/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class CodeVC: UIViewController {
    
    var visualEffect: UIVisualEffectView!
    var pictureView: UIImageView!
    var previous: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
//setting image view
        pictureView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        let picture = UIImage(named: "husky")
        pictureView.image = picture
        pictureView.contentMode = .scaleAspectFit
        pictureView.isUserInteractionEnabled = true
        self.view.addSubview(pictureView)
        
//setting effect view
        let blur = UIBlurEffect(style: .dark)
        visualEffect = UIVisualEffectView(effect: blur)
        visualEffect.translatesAutoresizingMaskIntoConstraints = false
        visualEffect.alpha = 0
        visualEffect.isUserInteractionEnabled = false
        
//make sure don't insert visualEffect view above picture view
        view.insertSubview(visualEffect, aboveSubview: view)

        visualEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        visualEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        visualEffect.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        visualEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        pictureView.becomeFirstResponder()
//        visualEffect.becomeFirstResponder()

//setting gesture recognizer
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.fadingOut(sender:)))
        pictureView.addGestureRecognizer(gesture)
//        visualEffect.addGestureRecognizer(gesture)
    }
    
    @objc func fadingOut(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: pictureView)
//        let translation = sender.translation(in: visualEffect)
print("translation.x \(translation.x)")
print("previous: \(previous)")
        let delta = translation.x - previous
print("delta: \(delta)")
        let width = pictureView.frame.size.width
print("width: \(width)")
print("delta/width: \(delta/width)")
print("visualEffect.alpha: \(visualEffect.alpha)")
        var alpha = visualEffect.alpha + (delta/width)
print("new alpha: \(alpha)")
        
        if alpha > 0.1 && alpha < 1 {
            visualEffect.alpha = alpha
print("Final alpha: \(visualEffect.alpha)")
        }
        else if alpha < 0.1 {
            alpha += 0.01
            visualEffect.alpha = alpha
print("Final alpha: \(visualEffect.alpha)")
        }
        
        if sender.state == .ended {
            previous = 0
        } else {
            previous = translation.x
        }

    }
}
