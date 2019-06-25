//
//  ViewController.swift
//  ReceptionAnimation
//
//  Created by Ken Myers on 2017/07/11.
//  Copyright © 2017年 Ken Myers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let shapeSize = CGSize(width: 10, height: 10)
        let containerSize = container?.bounds.size

        // Circle
        let circlePath = UIBezierPath(ovalIn: CGRect(origin: CGPoint.zero, size: shapeSize))
        let circle = Shape(color: UIColor.green, path: circlePath)
        circle.frame = CGRect(x: 0, y: (containerSize?.height)! - shapeSize.height, width: shapeSize.width, height: shapeSize.height)
        container?.addSubview(circle)

        // Square
        let squarePath = UIBezierPath(roundedRect: CGRect(origin: CGPoint.zero, size: shapeSize), cornerRadius: 2)
        let square = Shape(color: UIColor.orange, path: squarePath)
        square.frame = CGRect(x: (containerSize?.width)!/2, y: 0, width: shapeSize.width, height: shapeSize.height)
        container?.addSubview(square)

        // Triangle
        let trianglePath = UIBezierPath()
        trianglePath.lineWidth = 2
        trianglePath.move(to: CGPoint.zero)
        trianglePath.addLine(to: CGPoint(x: shapeSize.width, y: 0))
        trianglePath.addLine(to: CGPoint(x: shapeSize.width*0.7, y: shapeSize.height))
        trianglePath.addLine(to: CGPoint.zero)
        trianglePath.close()
        let triangle = Shape(color: UIColor.blue, path: trianglePath)
        triangle.frame = CGRect(x: (containerSize?.width)! - shapeSize.width, y: (containerSize?.height)! - shapeSize.height, width: shapeSize.width, height: shapeSize.height)
        container?.addSubview(triangle)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = .pi * 2.0
        rotateAnimation.duration = 1
        rotateAnimation.repeatCount = .greatestFiniteMagnitude
        container?.layer.add(rotateAnimation, forKey: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        container?.layer.removeAllAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

