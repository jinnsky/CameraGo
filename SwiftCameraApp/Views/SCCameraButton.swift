//
//  SCCameraButton.swift
//  SwiftCameraApp
//
//  Created by Jingtian Yang on 09/01/2018.
//  Copyright © 2018 Jingtian Yang. All rights reserved.
//

import UIKit

public protocol SCCameraButtonDelegate: class {
    
    /// Called when UITapGestureRecognizer begins
    
    func buttonWasTapped()
    
    /// Called When UILongPressGestureRecognizer enters UIGestureRecognizerState.began
    
    func buttonDidBeginLongPress()
    
    /// Called When UILongPressGestureRecognizer enters UIGestureRecognizerState.end
    
    func buttonDidEndLongPress()
    
    /// Called when the maximum duration is reached
    
    func longPressDidReachMaximumDuration()
    
    /// Sets the maximum duration of the video recording
    
    func setMaxiumVideoDuration() -> Double
}

// MARK: Public View Declaration


/// UIButton Subclass for Capturing Photo and Video with SwiftyCamViewController

open class SCCameraButton: UIButton {
    
    public weak var delegate: SCCameraButtonDelegate?
    
    private var circleBorder: CALayer!
    
    private var innerCircle: UIView!
    
    fileprivate var timer : Timer?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        drawButton()
        createGestureRecognizers()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawButton()
        createGestureRecognizers()
    }
    
    private func drawButton() {
        self.backgroundColor = UIColor.clear
        
        circleBorder = CALayer()
        circleBorder.backgroundColor = UIColor.clear.cgColor
        circleBorder.borderWidth = 6.0
        circleBorder.borderColor = UIColor.white.cgColor
        circleBorder.bounds = self.bounds
        circleBorder.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        circleBorder.cornerRadius = self.frame.size.width / 2
        layer.insertSublayer(circleBorder, at: 0)
        
    }
    
    public  func growButton() {
        innerCircle = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        innerCircle.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        innerCircle.backgroundColor = UIColor.red
        innerCircle.layer.cornerRadius = innerCircle.frame.size.width / 2
        innerCircle.clipsToBounds = true
        self.addSubview(innerCircle)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseOut, animations: {
            self.innerCircle.transform = CGAffineTransform(scaleX: 62.4, y: 62.4)
            self.circleBorder.setAffineTransform(CGAffineTransform(scaleX: 1.352, y: 1.352))
            self.circleBorder.borderWidth = (6 / 1.352)
            
        }, completion: nil)
    }
    
    public func shrinkButton() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.innerCircle.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.circleBorder.setAffineTransform(CGAffineTransform(scaleX: 1.0, y: 1.0))
            self.circleBorder.borderWidth = 6.0
        }, completion: { (success) in
            self.innerCircle.removeFromSuperview()
            self.innerCircle = nil
        })
    }
    
    @objc fileprivate func Tap() {
        delegate?.buttonWasTapped()
    }
    
    @objc fileprivate func LongPress(_ sender: UILongPressGestureRecognizer!)  {
        switch sender.state {
        case .began:
            delegate?.buttonDidBeginLongPress()
            startTimer()
        case .ended:
            invalidateTimer()
            delegate?.buttonDidEndLongPress()
        default:
            break
        }
    }
    
    @objc fileprivate func timerFinished() {
        invalidateTimer()
        delegate?.longPressDidReachMaximumDuration()
    }
    
    fileprivate func startTimer() {
        if let duration = delegate?.setMaxiumVideoDuration() {
            //Check if duration is set, and greater than zero
            if duration != 0.0 && duration > 0.0 {
                timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector:  #selector(SCCameraButton.timerFinished), userInfo: nil, repeats: false)
            }
        }
    }
    
    fileprivate func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    fileprivate func createGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SCCameraButton.Tap))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(SCCameraButton.LongPress))
        self.addGestureRecognizer(tapGesture)
        self.addGestureRecognizer(longGesture)
    }
}
