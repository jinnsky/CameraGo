//
//  SCMainViewController.swift
//  SwiftCameraApp
//
//  Created by Jingtian Yang on 18/01/2018.
//  Copyright © 2018 Jingtian Yang. All rights reserved.
//

import Foundation

import UIKit

class SCMainViewController: SCCameraViewController, SCCameraViewControllerDelegate {
    
    var captureButton: SCCameraButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraDelegate = self
        maximumVideoDuration = 10.0
        shouldUseDeviceOrientation = true
        allowAutoRotate = true
        audioEnabled = true
        
        
        self.captureButton = SCCameraButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 80, height: 80)))
        self.captureButton.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.height - 120)
        self.view.addSubview(self.captureButton)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureButton.delegate = self
    }
    
    func cameraViewController(_: SCCameraViewController, didTake photo: UIImage) {
        let photoViewController = SCPhotoViewController(image: photo)
        self.present(photoViewController, animated: true, completion: nil)
    }
    
    func cameraViewController(_: SCCameraViewController, didFocusAtPoint point: CGPoint) {

    }
    
    func cameraViewController(_: SCCameraViewController, didChangeZoomLevel zoom: CGFloat) {
        
    }
    
    func cameraViewController(_: SCCameraViewController, didSwitchCameras camera: SCCameraViewController.CameraSelection) {
        
    }
    
    func cameraViewController(_: SCCameraViewController, didBeginRecordingVideo camera: SCCameraViewController.CameraSelection) {
        
    }
    
    func cameraViewController(_: SCCameraViewController, didFinishRecordingVideo camera: SCCameraViewController.CameraSelection) {
        
    }
    
    func cameraViewController(_: SCCameraViewController, didFinishProcessVideoAt url: URL) {
        
    }
    
    func cameraViewController(_: SCCameraViewController, didFailToRecordVideo error: Error) {
        
    }
}
