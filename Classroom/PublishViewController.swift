//
//  PublishViewController.swift
//  Classroom
//
//  Created by Chew Lam on 8/4/14.
//  Copyright (c) 2014 BloomBoard, Inc. All rights reserved.
//

import UIKit

class PublishViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIAlertViewDelegate {

    @IBOutlet var skillText: UITextField
    @IBOutlet var skillPicker: UIPickerView
    @IBOutlet var commentText: UITextView
    @IBOutlet var publishButton: UIButton
    
    var elements: Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.skillText.hidden = true
        
        self.elements = ["Planning tips", "Lesson steps & timing", "Classroom space", "Academic discourse", "Performance based assessment", "Parent involvement"]

        self.edgesForExtendedLayout = UIRectEdge.None
        skillPicker.delegate = self
        skillPicker.dataSource = self
//        skillPicker.hidden = true
//        skillText.inputView = skillPicker
        publishButton.layer.cornerRadius = 40;
        publishButton.layer.borderColor = UIColor.darkGrayColor().CGColor
        publishButton.layer.borderWidth = 2
        skillText.delegate = self
    }
    
    func numberOfComponentsInPickerView(skillPicker: UIPickerView!) -> Int {
        return 1
    }
        
    func pickerView(skillPicker: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return self.elements!.count;
    }
    
    func pickerView(skillPicker: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String {
        return self.elements![row]
    }
    
    @IBAction func clickSkillText(sender: UITextField) {
        if (self.skillPicker) {
//            self.skillPicker.hidden = false
        }
    }
    
    @IBAction func clickPublish(sender: UIButton) {
        let alert = UIAlertView()
        alert.title = "Status"
        alert.message = "Your skill has been published.  Thanks for sharing!"
        alert.addButtonWithTitle("OK")
        alert.show()
            
        alert.delegate = self
    }
    
    func alertView(alertView: UIAlertView!, didDismissWithButtonIndex buttonIndex: Int) {
        sleep(1)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : HomeViewController = storyboard.instantiateViewControllerWithIdentifier("vhome") as HomeViewController
        vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(vc, animated: true, completion: {})
        
    }
    
    func pickerView(skillPicker: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
//        self.skillText.text = self.elements![row]
//        self.skillPicker.hidden = true
    }
    
    
}