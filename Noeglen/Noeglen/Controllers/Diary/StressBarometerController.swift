//
//  StressBarometerController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 25/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import fluid_slider

class StressBarometerController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stressSlider: Slider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        stressSlider.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 2
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * 10) as NSNumber) ?? ""
            return NSAttributedString(string: string)
        }
        stressSlider.setMinimumImage(UIImage(named: "sad"))
        stressSlider.setMaximumImage(UIImage(named: "happy"))
        stressSlider.imagesColor = UIColor.white.withAlphaComponent(0.8)
        stressSlider.setMinimumLabelAttributedText(NSAttributedString(string: ""))
        stressSlider.setMaximumLabelAttributedText(NSAttributedString(string: ""))
        stressSlider.fraction = 0.5
        stressSlider.shadowOffset = CGSize(width: 0, height: 10)
        stressSlider.shadowBlur = 5
        stressSlider.shadowColor = UIColor(white: 0, alpha: 0.1)
        stressSlider.contentViewColor = UIColor(red: 78/255.0, green: 77/255.0, blue: 224/255.0, alpha: 1)
        stressSlider.valueViewColor = .white
    }

}
