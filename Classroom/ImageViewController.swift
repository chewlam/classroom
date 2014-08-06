//
//  ImageViewController.swift
//  Classroom
//
//  Created by Chew Lam on 8/4/14.
//  Copyright (c) 2014 BloomBoard, Inc. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet var projectButton: UIButton
    @IBOutlet var questionButton: UIButton
    @IBOutlet var skillButton: UIButton
    @IBOutlet var cameraView: UIImageView
    
    var selectedImage: UIImage?
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.skillButton.layer.cornerRadius = 25
        self.skillButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.skillButton.layer.borderWidth = 2
        
        self.questionButton.layer.cornerRadius = 25
        self.questionButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.questionButton.layer.borderWidth = 2
        
        self.projectButton.layer.cornerRadius = 25
        self.projectButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.projectButton.layer.borderWidth = 2

        self.cameraView.layer.cornerRadius = 3
        self.cameraView.image = self.selectedImage!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

