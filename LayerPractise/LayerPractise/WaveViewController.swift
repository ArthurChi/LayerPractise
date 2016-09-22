//
//  WaveViewController.swift
//  LayerPractise
//
//  Created by cjfire on 16/9/22.
//  Copyright © 2016年 cjfire. All rights reserved.
//

import UIKit

class WaveViewController: UIViewController {

    // 振幅
    var waveAmplitude: Double = 30
    var waveHeight: CGFloat = 300
    // 周期
    var waveCycle: Double = 200
    var waveRate: Double = 0
    
    var offset: Double = 0
    // 速度
    var waveSpeed: Double = 0.2
    
    let waveLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        waveRate = 2 * M_PI / self.waveCycle
        
        view.backgroundColor = UIColor.whiteColor()
        
        waveLayer.fillColor = UIColor.greenColor().CGColor
        view.layer.addSublayer(waveLayer)
        waveLayer.frame = view.bounds
        
        let waveDisplaylink = CADisplayLink(target: self, selector: #selector(WaveViewController.waveInTime(_:)))
        waveDisplaylink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
    }
    
    @objc private func waveInTime(displaylink: CADisplayLink) {
        
        offset += waveSpeed
        
        let path = UIBezierPath()
        
        let currentWavePointY = view.bounds.size.height - waveHeight
        path.moveToPoint(CGPoint(x: 0, y: currentWavePointY))
        
        for x in 0..<Int(view.bounds.size.width) {
            
            let y = waveAmplitude * sin(waveRate * Double(x) + offset) + Double(currentWavePointY)
            
            path.addLineToPoint(CGPoint(x: Double(x), y: y))
        }
        
        path.addLineToPoint(CGPoint(x: CGRectGetMaxX(view.frame), y: CGRectGetMaxY(view.frame)))
        path.addLineToPoint(CGPoint(x: 0, y: CGRectGetMaxY(view.frame)))
        path.closePath()
        
        waveLayer.path = path.CGPath
    }
}
