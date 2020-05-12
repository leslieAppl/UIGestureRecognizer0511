//
//  CodeVC2.swift
//  UIGestureRecognizer0511
//
//  Created by leslie on 5/12/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class CodeVC2: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    var previous: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        //setting image view
        
        //setting effect view
        visualEffect.isUserInteractionEnabled = false
        picture.isUserInteractionEnabled = true
        picture.becomeFirstResponder()
        
        //setting gesture recognizer
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.fadingOut(sender:)))
        picture.addGestureRecognizer(gesture)

    }
    
    @objc func fadingOut(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: picture)

        print("translation.x \(translation.x)")
        print("previous: \(previous)")
        let delta = translation.x - previous
        print("delta: \(delta)")
        let width = picture.frame.size.width
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
