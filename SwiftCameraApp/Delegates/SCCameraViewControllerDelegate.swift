//
//  SCCameraViewControllerDelegate.swift
//  SwiftCameraApp
//
//  Created by Jingtian Yang on 04/01/2018.
//  Copyright © 2018 Jingtian Yang. All rights reserved.
//

import UIKit

public protocol SCCameraViewControllerDelegate: class {
    
    func cameraViewController(_: SCCameraViewController, didTake photo: UIImage)
    
    func cameraViewController(_: SCCameraViewController, didBeginRecordingVideo camera: SCCameraViewController.CameraSelection)
    
    func cameraViewController(_: SCCameraViewController, didFinishRecordingVideo camera: SCCameraViewController.CameraSelection)
    
    func cameraViewController(_: SCCameraViewController, didFinishProcessVideoAt url: URL)

    func cameraViewController(_: SCCameraViewController, didFailToRecordVideo error: Error)
    
    func cameraViewController(_: SCCameraViewController, didSwitchCameras camera: SCCameraViewController.CameraSelection)
    
    func cameraViewController(_: SCCameraViewController, didFocusAtPoint point: CGPoint)

    func cameraViewController(_: SCCameraViewController, didChangeZoomLevel zoom: CGFloat)
}

public extension SCCameraViewControllerDelegate {
    
    func cameraViewController(_: SCCameraViewController, didTake photo: UIImage) {
        // Optional
    }
    
    
    func cameraViewController(_: SCCameraViewController, didBeginRecordingVideo camera: SCCameraViewController.CameraSelection) {
        // Optional
    }
    
    
    func cameraViewController(_: SCCameraViewController, didFinishRecordingVideo camera: SCCameraViewController.CameraSelection) {
        // Optional
    }
    
    
    func cameraViewController(_: SCCameraViewController, didFinishProcessVideoAt url: URL) {
        // Optional
    }
    
    func cameraViewController(_: SCCameraViewController, didFailToRecordVideo error: Error) {
        // Optional
    }
    
    func cameraViewController(_: SCCameraViewController, didSwitchCameras camera: SCCameraViewController.CameraSelection) {
        // Optional
    }
    
    
    func cameraViewController(_: SCCameraViewController, didFocusAtPoint point: CGPoint) {
        // Optional
    }
    
    
    func cameraViewController(_: SCCameraViewController, didChangeZoomLevel zoom: CGFloat) {
        // Optional
    }
}
