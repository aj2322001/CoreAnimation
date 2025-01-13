//
//  AnimationsViewController.swift
//  CoreAnimation
//
//  Created by Archit Joshi on 07/01/25.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    @IBOutlet weak var holderView: UIView!
    
    var x = 20, y = 20, width = 140, height = 120
    private var animationView: UIView = UIView()
    private var coreAnimationType: CoreAnimationType = .shake
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        x = Int(self.holderView.frame.minX)
        y = Int(self.holderView.frame.minY)
        self.animationView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.animation()
    }
    
    func configure(with animationType: CoreAnimationType) {
        self.coreAnimationType = animationType
    }
    
    private func setUpView() {
        self.title = self.coreAnimationType.rawValue
        self.animationView.backgroundColor = .red
        self.holderView.addSubview(self.animationView)
        
    }
    
    private func animation(){
        switch self.coreAnimationType {
        case .move:
            self.moveAnimation()
        case .scale:
            self.scaleAnimation()
        case .rotate:
            self.rotateAnimation()
        case .shake:
            self.shakeAnimation()
        default:
            break
        }
    }

    private func moveAnimation() {
        x = Int(self.holderView.frame.minX)
        y = Int(self.holderView.frame.minY)
        self.animationView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        let toVal = Int(holderView.frame.maxX) - width/2
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = x + width/2
        animation.toValue = toVal
        animation.duration = 0.5
        
        self.animationView.layer.add(animation, forKey: nil)
        self.animationView.layer.position = CGPoint(x: toVal, y: y + height/2)
    }
    
    private func scaleAnimation() {
        x = Int(self.holderView.frame.midX) - (width/2)
        y = Int(self.holderView.frame.midY) - (height/2)
        self.animationView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        let toVal: CGFloat = 2
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = toVal
        animation.duration = 1
        
        self.animationView.layer.add(animation, forKey: "basic")
        self.animationView.layer.transform = CATransform3DMakeScale(toVal, toVal, 1)
    }
    
    private func rotateAnimation() {
        x = Int(self.holderView.frame.midX) - (width/2)
        y = Int(self.holderView.frame.midY) - (height/2)
        self.animationView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        let toVal: CGFloat = CGFloat.pi/4
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = 0
        animation.toValue = toVal
        animation.duration = 1
        
        self.animationView.layer.add(animation, forKey: "basic")
        self.animationView.layer.transform = CATransform3DMakeRotation(toVal, 0, 0, 1)
    }
    
    private func shakeAnimation() {
        x = Int(self.holderView.frame.midX) - (width/2)
        y = Int(self.holderView.frame.midY) - (height/2)
        self.animationView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0,10,-10,10,0]
        animation.keyTimes = [0,0.16,0.5,0.83,1]
        animation.duration = 1
        animation.isAdditive = true
        
        self.animationView.layer.add(animation, forKey: "shake")
    }
}
