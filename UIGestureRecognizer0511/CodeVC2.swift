//
//  CodeVC2.swift
//  UIGestureRecognizer0511
//
//  Created by leslie on 5/12/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class CodeVC2: UIViewController {

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
        visualEffect.alpha = 0.5
        visualEffect.isUserInteractionEnabled = false

        view.insertSubview(visualEffect, aboveSubview: view)
        
        visualEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        visualEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        visualEffect.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        visualEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }
    


}
