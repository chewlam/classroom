//
//  HomeViewController.swift
//  Classroom
//
//  Created by Chew Lam on 8/4/14.
//  Copyright (c) 2014 BloomBoard, Inc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UINavigationControllerDelegate {
    
//    @IBOutlet var cameraView: UIImageView
    @IBOutlet var snapButton: UIButton
    @IBOutlet var libraryButton: UIButton

    var imagePicker: UIImagePickerController?
    var usingPopover: Bool?
    var imagePopover: UIPopoverController?
    
    @IBAction func openLibrary(sender: UIButton) {
        self.imagePicker = UIImagePickerController()
        
        self.imagePicker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.imagePicker!.delegate = self
        self.imagePicker!.allowsEditing = true

        self.usingPopover = true
        self.imagePopover = UIPopoverController(contentViewController: self.imagePicker)
        self.imagePopover!.delegate = self
        var popoverFrame = CGRect()
        
        popoverFrame.origin = sender.frame.origin
        popoverFrame.size.width = 1;
        popoverFrame.size.height = 1;
        
        self.imagePopover!.presentPopoverFromRect(popoverFrame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
    }

    
    @IBAction func capture(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            self.imagePicker = UIImagePickerController()
            
            self.imagePicker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePicker!.delegate = self
            self.imagePicker!.allowsEditing = true
            self.usingPopover = true

            println("Button capture")
            self.usingPopover = false

            self.imagePicker!.sourceType = UIImagePickerControllerSourceType.Camera;
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        else {
            self.openLibrary(sender)
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.snapButton.layer.cornerRadius = 40
        self.snapButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.snapButton.layer.borderWidth = 2

        
        self.libraryButton.layer.cornerRadius = 40
        self.libraryButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.libraryButton.layer.borderWidth = 2


//        self.cameraView.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        if self.usingPopover {
//            self.imagePopover!.dismissPopoverAnimated(false)
        }
        else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        self.dismissViewControllerAnimated(true, completion: {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : ImageViewController = storyboard.instantiateViewControllerWithIdentifier("vimage") as ImageViewController
            vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            vc.selectedImage = image;
            self.presentViewController(vc, animated: true, completion: {})
        })
    }

}



