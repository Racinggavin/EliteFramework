//
//  EliteViewController.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/16.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension UIViewController {

    // 過場動畫
    public enum TransferAnimation {
        case Push
        case Present
        case Fade
    }
    
    // MARK:
    public func transferViewController(identifier: String?, animation: TransferAnimation) {
        return transferViewController(storyboard: storyboard!, identifier: identifier, animation: animation)
    }
    
    // MARK:
    public func transferViewController(storyboard storyboard: String?, identifier: String?, animation: TransferAnimation) {
        
        if storyboard == nil {
            return ;
        }
        
        let storyboard = UIStoryboard(name: storyboard!, bundle: nil)
        
        return transferViewController(storyboard: storyboard, identifier: identifier, animation: animation)
    }
    
    // MARK:
    public func transferViewController(storyboard storyboard: UIStoryboard?, identifier: String?, animation: TransferAnimation) {
        
        // 防呆
        if storyboard == nil || identifier == nil || identifier?.length <= 0 {
            return
        }
        
        let tatgetViewController = storyboard!.instantiateViewControllerWithIdentifier(identifier!)
        
        let transition = CATransition()
        
        //
        switch animation {
        case .Push:
            dispatch_async(dispatch_get_main_queue()) {
                self.navigationController?.pushViewController(tatgetViewController, animated: true)
            }
        case .Present:
            dispatch_async(dispatch_get_main_queue()) {
                self.navigationController?.presentViewController(tatgetViewController, animated: false, completion: nil)
            }
        case .Fade:
            transition.type = kCATransitionFade
            transition.duration = 0.2
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            
            view.window?.layer.addAnimation(transition, forKey: nil)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(tatgetViewController, animated: false, completion: nil)
            }
        }
    }
    
    // MARK:
    public func transferCameraViewController() -> UIImagePickerController {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .Camera
        
        dispatch_async(dispatch_get_main_queue()) {
            self.view.window?.rootViewController?.presentViewController(imagePickerController, animated: true, completion: nil)
        }
        
        return imagePickerController
    }
    
    // MARK:
    public func transferPhotoLibraryViewController() -> UIImagePickerController {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .PhotoLibrary
        
        dispatch_async(dispatch_get_main_queue()) {
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
        
        return imagePickerController
    }
    
    // MARK:
    public func alertView(title title: String?, button: String?) {
        alertView(title: title, message: nil, button: button)
    }
    
    // MARK:
    public func alertView(title title: String?, message: String?, button: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: button, style: .Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}

//class 