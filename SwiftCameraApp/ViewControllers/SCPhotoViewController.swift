//
//  SCPhotoViewController.swift
//  SwiftCameraApp
//
//  Created by Jingtian Yang on 18/01/2018.
//  Copyright © 2018 Jingtian Yang. All rights reserved.
//

import UIKit

class SCPhotoViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private var backgroundImage: UIImage
    
    init(image: UIImage) {
        self.backgroundImage = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func loadView() {
        self.view = UIView(frame: UIScreen.main.fixedCoordinateSpace.bounds)
        self.view.backgroundColor = UIColor.gray
        let backgroundImageView = UIImageView(frame: view.frame)
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFit
        backgroundImageView.image = backgroundImage
        view.addSubview(backgroundImageView)
        let cancelButton = UIButton(frame: CGRect(x: 10.0, y: 10.0, width: 100.0, height: 60.0))
        cancelButton.setTitle("Cancel", for: UIControlState())
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(cancelButton)
        
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
}
