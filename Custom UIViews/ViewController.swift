//
//  ViewController.swift
//  Custom UIViews
//
//  Created by Razvigor Andreev on 12/31/14.
//  Copyright (c) 2014 Razvigor Andreev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // Create Properties
    
    
    var numberLabel: UILabel!
    var numberBarView: UIView!
    var sliderBarView: UIView!
    var numberSlider: UISlider!
    var textView: UITextView!
    
    var number: Int = 10
    var minValue: Int = 1
    var maxValue: Int = 120
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //setup UI programatically
        
        createMultiplicationTableUI()
        
        
    }
    
    
    func createMultiplicationTableUI() {
        
        
        // main View
        
        view.backgroundColor = UIColor.grayColor()
        
        // get size info
        println("Screen size bounds: \(UIScreen.mainScreen().bounds)")
        println("Screen scale: \(UIScreen.mainScreen().scale)")
        
        // width
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        //height
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // text label
        
        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        numberLabel.backgroundColor = UIColor.orangeColor()
        
        numberLabel.text = "10"
        numberLabel.textAlignment = NSTextAlignment.Center
        numberLabel.font = UIFont.boldSystemFontOfSize(32)
        
        numberLabel.layer.cornerRadius = 20
        numberLabel.clipsToBounds = true
        
        
        //animate Number Label
        let numberEndX = numberLabel.frame.origin.x
        let numberStartX = numberEndX - screenWidth
        
        numberLabel.frame.origin.x = numberStartX
        
        UILabel.animateWithDuration(1.5, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: nil, animations: {
            
            self.numberLabel.frame.origin.x = numberEndX
            
        }, completion: nil)
        

        
        //view behind text label
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        numberBarView = UIView(frame: CGRect(x: 0, y: statusBarHeight, width: screenWidth, height: 80))
        numberBarView.backgroundColor = UIColor.darkGrayColor()
        
        
        numberBarView.addSubview(numberLabel)
        numberLabel.center = CGPoint(x: numberBarView.bounds.size.width / 2, y: numberBarView.bounds.size.height / 2)
        
        
        // slider view
        
        sliderBarView = UIView(frame: CGRect(x: 0, y: numberBarView.frame.origin.y + numberBarView.frame.height, width: screenWidth, height: 40))
        sliderBarView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(sliderBarView)
        
        let sliderBarEndY = sliderBarView.frame.origin.y
        let sliderBarStartY = sliderBarEndY - sliderBarView.frame.size.height
        
        sliderBarView.frame.origin.y = sliderBarStartY
    
        UIView.animateWithDuration(1.5, delay: 1, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: {
            
            self.sliderBarView.frame.origin.y = sliderBarEndY
            
        }, completion: nil)
        
        // UISlider
        
        numberSlider = UISlider(frame: sliderBarView.bounds)
        
        numberSlider.minimumValue = Float(minValue)
        numberSlider.maximumValue = Float(maxValue)
        numberSlider.value = Float(number)
        
        numberSlider.minimumTrackTintColor = UIColor.greenColor()
        numberSlider.maximumTrackTintColor = UIColor.blueColor()
        
        
        sliderBarView.addSubview(numberSlider)
        view.addSubview(numberBarView)          // add BarView here so it's on top of the slider !
        
        // target the slider
        
        numberSlider.addTarget(self, action: Selector("numberSliderChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        
        
        // text view
        
        let textViewY = sliderBarView.frame.origin.y + sliderBarView.frame.size.height
        let restOfHeight = (screenHeight - textViewY)
        
        textView = UITextView(frame: CGRect(x: 0, y: textViewY , width: screenWidth, height: restOfHeight))
        textView.backgroundColor = UIColor.grayColor()
        view.addSubview(textView)
        
        
        textView.text = "Line 1 \n Line2 \n Line3"
        textView.font = UIFont.systemFontOfSize(20)
        textView.textAlignment = NSTextAlignment.Center
        
        
        textView.text = generateMultiplicationTable(number)
        textView.editable = false
        
        // animate text field
        
        let textEndY = textView.frame.origin.y
        let textStartY = textEndY - sliderBarView.frame.size.height
        
        textView.frame.origin.y = textStartY
        
        UIView.animateWithDuration(1.5, delay: 1, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: {
            
            self.textView.frame.origin.y = textEndY
            
            }, completion: nil)
        
    }
    
    
    
    
    
    func numberSliderChanged(slider: UISlider) {
        
        number = Int(slider.value)
        numberLabel.text = "\(number)"
        
        textView.text = generateMultiplicationTable(number)
        
    }
    
    func generateMultiplicationTable(value: Int) -> String {
        
        var output: String = ""
        
        for i in minValue...maxValue {
            output += "\(i) x \(value) = \(i * value)\n"
            
        }
        
        
        return output
        
    }
    
    



}

