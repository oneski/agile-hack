//
//  ViewController.swift
//  AVCam
//
//  Created by David E. Silverman on 3/7/15.
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

import Foundation

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var eraser: UIButton!
    //    @IBOutlet weak var PhotoOpeningView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    var colors: [String] = ["Black", "Blue", "Green", "Red", "Yellow", "Orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.hidden = true
        self.slider.hidden = true
        self.eraser.hidden = true
        //        view.backgroundColor = UIColor(patternImage: UIImage(named: "Image.pgn")!)
        //            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearTapped() {
        var theDrawView = drawView as DrawView
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
    }
    
    @IBAction func colorTapped(button: UIButton!) {
        hideEditor()
    }
    
    @IBAction func sliderValueChanged(slider: UISlider!) {
        drawView.lineWidth = CGFloat(slider.value * 100)
    }
    
    @IBAction func eraserTapped() {
        drawView.drawColor = UIColor.whiteColor()
        hideEditor()
    }
    
    @IBAction func save() {
        screenShotMethod()
    }
    
    @IBAction func choosePhoto(sender: AnyObject) {
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        //Select the image from photo library
        imagePickerView.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePickerView, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var image = info[UIImagePickerControllerOriginalImage] as UIImage
        //        view.backgroundColor = UIColor(patternImage: UIImage(named: image))
        //        view.layer.contents = UIImage(named: "\(image)").CGImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func screenShotMethod() {
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String {
        return colors[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        var selection = colors[row]
        colorSelection(selection)
    }
    
    func colorSelection(color: String) {
        //var theDrawView = drawView as DrawView
        var colorSet: UIColor!
        
        switch color {
        case "Black":
            colorSet = UIColor.blackColor()
        case "Blue":
            colorSet = UIColor.blueColor()
        case "Green":
            colorSet = UIColor.greenColor()
        case "Red":
            colorSet = UIColor.redColor()
        case "Yellow":
            colorSet = UIColor.yellowColor()
        case "Orange":
            colorSet = UIColor.orangeColor()
        default:
            colorSet = UIColor.whiteColor()
        }
        
        hideEditor()
        
        drawView.drawColor = colorSet
    }
    
    func hideEditor() {
        picker.hidden = !picker.hidden
        slider.hidden = !slider.hidden
        eraser.hidden = !eraser.hidden
    }
    
}