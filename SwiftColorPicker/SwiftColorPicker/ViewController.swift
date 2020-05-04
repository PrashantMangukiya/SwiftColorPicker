//
//  ViewController.swift
//  SwiftColorPicker
//
//  Created by Prashant on 02/09/15.
//  Copyright (c) 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, ColorPickerDelegate {
    
    // outlet - selected color preview
    @IBOutlet var colorPreview: UIView!
    
    
    // outlet - change color button
    @IBOutlet var changeColorButton: UIButton!
    
    // action - called when change color button clicked
    @IBAction func changeColorButtonClicked(sender: UIButton) {
        self.showColorPicker()
    }
    
    
    // outlet - change color button placed at navigation bar (right side)
    @IBOutlet var changeColorButtonNav: UIBarButtonItem!
    
    // action - change color button placed at navigation bar (right side)
    @IBAction func changeColorButtonNavClicked(sender: UIBarButtonItem) {
        self.showColorPickerFromNavBar()
    }
    
    
    // class varible maintain selected color value
    var selectedColor: UIColor = UIColor.blue
    var selectedColorHex: String = "0000FF"
    
    
    
    
    
    // MARK: - View functions
    
    // called after view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // set corner radious
        self.colorPreview.layer.cornerRadius = self.colorPreview.layer.frame.width/6
        
        // set default background color
        self.colorPreview.backgroundColor = self.selectedColor
    }

    
    // called if received memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

    
    // MARK: Popover delegate functions

    // Override iPhone behavior that presents a popover as fullscreen.
    // i.e. now it shows same popover box within on iPhone & iPad
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
        // show popover box for iPhone and iPad both
        return UIModalPresentationStyle.none
    }
    
    
    
    
    
    // MARK: Color picker delegate functions
    
    // called by color picker after color selected.
    func colorPickerDidColorSelected(selectedUIColor: UIColor, selectedHexColor: String) {
       
        // update color value within class variable
        self.selectedColor = selectedUIColor
        self.selectedColorHex = selectedHexColor
        
        // set preview background to selected color
        self.colorPreview.backgroundColor = selectedUIColor
    }
    
    
    
    
    
    // MARK: - Utility functions
    
    // show color picker from UIButton
    private func showColorPicker(){
        
        // initialise color picker view controller
        let colorPickerVc = storyboard?.instantiateViewController(withIdentifier: "sbColorPicker") as! ColorPickerViewController
        
        // set modal presentation style
        colorPickerVc.modalPresentationStyle = .popover
        
        // set max. size
        colorPickerVc.preferredContentSize = CGSize.init(width: 265, height: 410)
        
        // set color picker deleagate to current view controller
        // must write delegate method to handle selected color
        colorPickerVc.colorPickerDelegate = self
        
        // show popover
        if let popoverController = colorPickerVc.popoverPresentationController {
            
            // set source view
            popoverController.sourceView = self.view
            
            // show popover form button
            popoverController.sourceRect = self.changeColorButton.frame
            
            // show popover arrow at feasible direction
            popoverController.permittedArrowDirections = UIPopoverArrowDirection.any
            
            // set popover delegate self
            popoverController.delegate = self
        }
        
        //show color popover
        present(colorPickerVc, animated: true, completion: nil)
    }
    
    
    // show color picker from Navigation Bar Button
    private func showColorPickerFromNavBar(){
        
        // initialise color picker view controller
        let colorPickerVc = storyboard?.instantiateViewController(withIdentifier: "sbColorPicker") as! ColorPickerViewController
        
        // set modal presentation style
        colorPickerVc.modalPresentationStyle = .popover
        
        // set max. size
        colorPickerVc.preferredContentSize = CGSize.init(width: 265, height: 410)
        
        // set color picker deleagate to current view controller
        // must write delegate method to handle selected color
        colorPickerVc.colorPickerDelegate = self
        
        // show popover
        if let popoverController = colorPickerVc.popoverPresentationController {
            
            // show popover from navigation bar button
            popoverController.barButtonItem = self.changeColorButtonNav
            
            // show popover arrow at feasible direction
            popoverController.permittedArrowDirections = UIPopoverArrowDirection.any
            
            // set popover delegate self
            popoverController.delegate = self
        }
        
        // show color popover
        present(colorPickerVc, animated: true, completion: nil)
    }    
    

}

