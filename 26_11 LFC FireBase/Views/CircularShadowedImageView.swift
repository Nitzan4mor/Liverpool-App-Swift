//
//  CircularShadowedImageView.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 29/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

@IBDesignable class CircularShadowedImageView: UIView {

    @IBInspectable var shadowRadius:Double = 1.0{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var shadowOpacity:Double = 0.8{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var shadowColor:UIColor = .black {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var shadowOffest:CGSize = .zero{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var image:UIImage = UIImage(named: "LFC", in: Bundle(for: CircularShadowedImageView.self), compatibleWith: nil)!{
        didSet{
            updateView()
        }
    }
    
    lazy var imageLayer:CALayer = {
       let imageLayer = CALayer()
        imageLayer.borderColor = UIColor.black.cgColor
        imageLayer.borderWidth = 1.5
        imageLayer.masksToBounds = true
        return imageLayer
    }()
    
    lazy var maskLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        return layer
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        maskLayer.frame = self.bounds
        maskLayer.path = UIBezierPath(ovalIn: maskLayer.bounds).cgPath
        imageLayer.frame = self.bounds
        imageLayer.cornerRadius = self.bounds.width / 2
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateView()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    func updateView(){
        layer.shadowRadius = CGFloat(self.shadowRadius)
        layer.shadowOpacity = Float(self.shadowOpacity)
        layer.shadowColor = self.shadowColor.cgColor
        layer.shadowOffset = self.shadowOffest
        
        layer.addSublayer(imageLayer)
        layer.addSublayer(maskLayer)
        layer.backgroundColor = UIColor.clear.cgColor
        
        imageLayer.contents = image.cgImage

    }
}
