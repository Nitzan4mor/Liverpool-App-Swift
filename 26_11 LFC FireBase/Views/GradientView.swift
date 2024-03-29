//
//  GradientView.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 29/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLayer()
    }

    override class var layerClass: AnyClass{
        return CAGradientLayer.self
    }
    
    @IBInspectable var firstColor: UIColor = UIColor.magenta {
        didSet{
            updateLayer()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.darkGray {
        didSet{
            updateLayer()
        }
    }
    
    @IBInspectable var startPoint:CGPoint = .zero {
        didSet{
            updateLayer()
        }
    }
    
    @IBInspectable var endPoint:CGPoint = CGPoint(x: 1, y: 1) {
        didSet{
            updateLayer()
        }
    }
    
    @IBInspectable var shadowColor:UIColor = UIColor.black{
        didSet{
            updateLayer()
        }
    }
    
    @IBInspectable var shadowOffset:CGSize = .zero{
        didSet{
           updateLayer()
        }
    }
    
    @IBInspectable var shadowRadius:Double = 1.0{
        didSet{
           updateLayer()
        }
    }
    
    @IBInspectable var shadowOpacity:Double = 0.8{
        didSet{
           updateLayer()
        }
    }
    
    @IBInspectable var isCircle:Bool = false{
        didSet{
           updateLayer()
        }
    }

    
    func updateLayer(){
        guard let layer = self.layer as? CAGradientLayer else {return}
        
        layer.colors = [
            firstColor.cgColor,
            secondColor.cgColor
        ]
        
        layer.startPoint = self.startPoint
        layer.endPoint = self.endPoint
        
        layer.shadowColor = self.shadowColor.cgColor
        layer.shadowOffset = self.shadowOffset
        layer.shadowRadius = CGFloat(self.shadowRadius)
        layer.shadowOpacity = Float(self.shadowOpacity)
        
        if isCircle{
            layer.cornerRadius = self.bounds.height / 2
        }
        layer.borderColor = AppColors.gray.cgColor
        layer.borderWidth = 1.5
    }
}
