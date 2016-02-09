//
//  ViewController.swift
//  tipster
//
//  Created by David Rothschild on 1/8/16.
//  Copyright © 2016 Dave Rothschild. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    let tips = Tips()
    var groupSliderRound = 1.0
    var tipSliderRound = 5.0
    let step: Float = 1
    
    
    @IBOutlet var calcButton: [UIButton]!


    @IBAction func tipSlider(sender: UISlider) {
        tipSliderBtn.minimumValue  = 5
        tipSliderBtn.maximumValue = 30
        tipSliderBtn.continuous = true
        
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        
        tipSliderRound = Double(sender.value).roundToPlaces(0)
        
        tips.percentChangeFunc(tipSliderRound)
        
        tipPercent[0].text = String ( Int(tipSliderRound) ) + "%"
        tipPercent[1].text = String ( Int(tipSliderRound) + 5) + "%"
        tipPercent[2].text = String ( Int(tipSliderRound) + 10) + "%"

        updateLabels()
        
    }
    
    @IBAction func groupSlider(sender: UISlider) {
        groupSizeBtn.minimumValue = 1
        groupSizeBtn.maximumValue = 10
        groupSizeBtn.continuous = true
        
        let roundedValueGroup = round(sender.value / step) * step
        sender.value = roundedValueGroup
        
        groupSliderRound = Double(sender.value).roundToPlaces(0)
        tips.groupSliderChange(groupSliderRound)
        
        updateLabels()
    }

    @IBAction func calcBtnPressed(sender: UIButton) {
        tips.calc(sender.tag)
        totalBill.text = "$" + tips.totalCalcString
        updateLabels()
        
    }
    
    @IBAction func clearBtnPressed(sender: UIButton) {
        clearTips()
    }
    @IBOutlet weak var totalBill: UILabel!
    @IBOutlet var tipPercent: [UILabel]!
    @IBOutlet var tipAmount: [UILabel]!
    @IBOutlet var tipTotal: [UILabel]!
    
    @IBOutlet weak var tipSliderBtn: UISlider!
    @IBOutlet weak var groupSizeBtn: UISlider!
    @IBOutlet weak var numInGroup: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blackColor()
        clearTips()
        groupSizeBtn.value = 0
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func clearTips() {
        // var billConversion = (totalBill.text! as NSString).floatValue
        tips.clearClassVars()
        let totalStart = 0.00
        let totalString = "$"+String(format: "%0.2f", totalStart)
        totalBill.text = totalString
        tipPercent[0].text = "10%"
        tipPercent[1].text = "15%"
        tipPercent[2].text = "20%"
        numInGroup.text = "1"
        for tip in tipAmount {
            tip.text = "0.0"
        }
        for tippy in tipTotal {
            tippy.text = "0.0"
        }
    }
    // tipSliderRound = Double(sender.value).roundToPlaces(0)
    
    func updateLabels() {
        tipAmount[0].text = "$" + String( Double(tips.tipAmount1).roundToPlaces(2) )
        tipAmount[1].text = "$" + String( Double(tips.tipAmount2).roundToPlaces(2) )
        tipAmount[2].text = "$" + String( Double(tips.tipAmount3).roundToPlaces(2) )
        
        tipTotal[0].text = "$" + String( Double(tips.tipTotalAmount1).roundToPlaces(2) )
        tipTotal[1].text = "$" + String( Double(tips.tipTotalAmount2).roundToPlaces(2) )
        tipTotal[2].text = "$" + String( Double(tips.tipTotalAmount3).roundToPlaces(2) )
        
        numInGroup.text = String( Int(groupSliderRound ) )
    }
}

