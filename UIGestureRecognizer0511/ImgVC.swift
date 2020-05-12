//
//  ViewController.swift
//  UIGestureRecognizer0511
//
//  Created by leslie on 5/11/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ImgVC: UIViewController {
    
    var previous: CGFloat = 0
    @IBOutlet weak var picture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        picture.isUserInteractionEnabled = true
    }

    @IBAction func fadingOut(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: picture)
        print("translation.x \(translation.x)")
        print("previous: \(previous)")
        let delta = translation.x - previous
        print("delta: \(delta)")
        let width = picture.frame.size.width
        print("width: \(width)")
        print("delta/width: \(delta/width)")
        print("picture.alpha: \(picture.alpha)")
        let alpha = picture.alpha + (delta/width)
        print("new alpha: \(alpha)")

        if alpha > 0.1 && alpha < 1 {
            picture.alpha = alpha
        }
        
        if sender.state == .ended {
            previous = 0
        } else {
            previous = translation.x
        }
    }
    
}

