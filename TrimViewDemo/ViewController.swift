//
//  ViewController.swift
//  TrimViewDemo
//
//  Created by 詹瞻 on 2018/5/17.
//  Copyright © 2018年 developZHAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var trimView: TrimView!
    @IBOutlet weak var sliderView: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderView.addTarget(self, action: #selector(sliderValueChanged(sender:)), for: UIControlEvents.valueChanged)
    }

    @objc func sliderValueChanged(sender: UISlider) {
        trimView.trimPercent = CGFloat(sender.value)
    }

}

