//
//  StressBarometerController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 25/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import fluid_slider
import Foundation

class StressBarometerController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stressSlider: Slider!
    
    var moodText = ""
    var moodValue = 0
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStressSlider()
        
    }
    
    // MARK: - Functions
    
    private func setupStressSlider() {
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
    
    @IBAction func goToPopUpButton(_ sender: Any) {
        if (round(stressSlider.fraction * 10) < 5) {
                moodText = "Det er jeg ked af at høre... Har du lyst til at uddybe, hvad der har gjort din dag mindre god?"
                moodValue = Int(round(stressSlider.fraction * 10))
            } else {
                moodText = "Det er godt at høre! Har du lyst til at uddybe, hvad der har gjort din dag idag god?"
                moodValue = Int(round(stressSlider.fraction * 10))
            }
            performSegue(withIdentifier: "mood", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! PopUpViewController
            vc.finalMood = moodText
            vc.finalMoodValue = moodValue
    }
}
