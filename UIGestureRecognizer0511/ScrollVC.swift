//
//  ScrollVC.swift
//  UIGestureRecognizer0511
//
//  Created by leslie on 5/12/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ScrollVC: UIViewController {
    
    var image: UIImageView!
    var zooming = false
    
    @IBOutlet weak var mainScroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mainScroll.delegate = self
        mainScroll.minimumZoomScale = 1.0
        mainScroll.maximumZoomScale = 4.0
        
        image = UIImageView(image: UIImage(named: "doll"))
        
        mainScroll.contentSize = CGSize(width: image.frame.size.width, height: image.frame.size.height)
        mainScroll.addSubview(image)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.zoomPicture(sender:)))
        mainScroll.addGestureRecognizer(gesture)
    }
    
    @objc func zoomPicture(sender: UITapGestureRecognizer) {
        if !zooming {
            let position = sender.location(in: mainScroll)
            print("position: \(position)")
            mainScroll.zoom(to: CGRect(x: position.x, y: position.y, width: 1, height: 1), animated: true)
            zooming = true
        } else {
            mainScroll.setZoomScale(1.0, animated: true)
            zooming = false
        }
    }
    
}

extension ScrollVC: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
}
