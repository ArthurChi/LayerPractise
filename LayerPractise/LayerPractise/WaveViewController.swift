//
//  WaveViewController.swift
//  LayerPractise
//
//  Created by cjfire on 16/9/22.
//  Copyright © 2016年 cjfire. All rights reserved.
//

import UIKit

class WaveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let waveLayer = CAShapeLayer()
        waveLayer.fillColor = UIColor.greenColor().CGColor
        view.layer.addSublayer(waveLayer)
        
        let path = UIBezierPath()
        
        path.moveToPoint(CGPoint(x: 0, y: 50))
        
        for i in 0..<Int(view.bounds.size.width) {
            
            print(sin(Double(i)))
        }
        
//        let waveDisplaylink = CADisplayLink(target: self, selector: #selector(WaveViewController.waveInTime(_:)))
//        waveDisplaylink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
    }
    
    @objc private func waveInTime(displaylink: CADisplayLink) {
        
//        var path = CGPathCreateMutable()
        
    }
}
