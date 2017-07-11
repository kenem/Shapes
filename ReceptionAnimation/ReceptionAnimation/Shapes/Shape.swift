// CoineyKit
// Copyright © Coiney Inc. All rights reserved.
// For licensing information, contact info@coiney.com.

import UIKit

class Shape: UIView {
    
    init(color: UIColor, path: UIBezierPath) {
        super.init(frame: CGRect.zero)
        path.lineWidth = 2
        let layer = self.layer as! CAShapeLayer
        layer.path = path.cgPath
        layer.strokeColor = color.cgColor
        layer.fillColor = UIColor.clear.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

}
