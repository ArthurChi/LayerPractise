//
//  ViewController.swift
//  LayerPractise
//
//  Created by cjfire on 16/9/21.
//  Copyright © 2016年 cjfire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let gradientLayer = CAGradientLayer()
    let textLayer = CATextLayer()
    let bgView = UIView()
    let layerW: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(bgView)
        bgView.backgroundColor = UIColor.brownColor()
        bgView.frame = CGRect(x: 0, y: 40, width: view.bounds.size.width, height: view.bounds.size.width)
        
        setupTextLayer()
        setupGradientLayer()
    }

    
    private func setupTextLayer() {
        
        bgView.layer.addSublayer(textLayer)
        textLayer.frame = CGRect(x: 0.5 * (bgView.bounds.size.width - layerW), y: 0.5 * (bgView.bounds.size.width - layerW), width: layerW, height: layerW)
        textLayer.foregroundColor = UIColor.blackColor().CGColor
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.wrapped = true
        textLayer.string = "这是一段测试文字, 看看效果"
        
        let font = UIFont.systemFontOfSize(18)
        let fontRef = CGFontCreateWithFontName(font.fontName as CFString)
        textLayer.font = fontRef
        textLayer.fontSize = font.pointSize
        textLayer.contentsScale = UIScreen.mainScreen().scale
        
    }
    
    private func setupGradientLayer() {
        
        bgView.layer.addSublayer(gradientLayer)
        
        var tmpColors = Array<CGColor>()
        
        for _ in 0..<20 {
            tmpColors.append(UIColor.colorWithHexRGB(0x000000).CGColor)
            tmpColors.append(UIColor.colorWithHexRGB(0xFFD700).CGColor)
        }
        
        gradientLayer.colors = tmpColors
        
        var tmpLocation = Array<NSNumber>()
        
        for i in 0...10 {
            tmpLocation.append(NSNumber(float: 0.1 * Float(i)))
        }
        
        gradientLayer.locations = tmpLocation
        
        gradientLayer.startPoint = CGPointZero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.mask = textLayer
        gradientLayer.frame = bgView.bounds
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        let animation = CABasicAnimation(keyPath: "position")
        let offset = 0.5 * (bgView.bounds.size.width - layerW)
        let fromPoint = textLayer.position
        let toPoint = CGPoint(x: fromPoint.x + offset, y: fromPoint.y)
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.fromValue = NSValue(CGPoint: fromPoint)
        animation.toValue = NSValue(CGPoint: toPoint)
        animation.autoreverses = true
        textLayer.addAnimation(animation, forKey: nil)

        let animation2 = animation.copy() as! CABasicAnimation
        let fromPoint2 = gradientLayer.position
        let toPoint2 = CGPoint(x: fromPoint.x - offset, y: fromPoint.y)
        animation2.fromValue = NSValue(CGPoint: fromPoint2)
        animation2.toValue = NSValue(CGPoint: toPoint2)
        gradientLayer.addAnimation(animation2, forKey: nil)
    }
}

extension UIColor {
    
    class func colorWithHexRGB(rgbValue: Int) -> UIColor {
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16)/255.0, green: CGFloat((rgbValue & 0xFF00) >> 8)/255.0, blue: CGFloat(rgbValue & 0xFF)/255.0, alpha: 1.0)
    }
}