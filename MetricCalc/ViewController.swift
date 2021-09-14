//
//  ViewController.swift
//  MetricCalc
//
//  Created by Arielle Sinicin on 9/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imperialData: UITextField!
    @IBOutlet weak var imperialLabel: UILabel!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var metricLabel: UILabel!
    
    @IBOutlet weak var modeSelection: UIBarButtonItem!
    
    
    // Labels for units
    let units = ["Temperature": ["imperial": "°F", "metric": "°C"],
                 "Length": ["imperial": "Miles", "metric": "Km"],
                 // new
                 "Mass": ["imperial": "Ibs", "metric": "Kgs"],
                 "Volume": ["imperial": "Gallons", "metric": "Liters"] ]
    
    // model variable
    var calculatorModel = MetricCalculator (currentMode: CalculatorModes.temperature)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupModeMenu()
        selectMode(mode: .temperature)
    }

    @IBAction func convert(_ sender: Any) {
        if let enteredValue = Double (imperialData.text ?? "0.00") {
            imperialData.resignFirstResponder()
            let resultValue = calculatorModel.computeMetricMeasurement(inputData: enteredValue)
            result.text = String (format: "%.2f", resultValue)
        }
    }
    
    func setupModeMenu () {
        let temperatureAction = UIAction (title:"Temperature", image: UIImage(systemName: "thermometer.sun.fill")) { (action) in
            self.selectMode (mode: .temperature)
        }
        let lengthAction = UIAction (title:"Length", image: UIImage(systemName: "ruler.fill")) { (action) in
            self.selectMode (mode: .length)
        }
        // new
        let massAction = UIAction (title:"Mass", image: UIImage(systemName: "scalemass.fill")) { (action) in
            self.selectMode (mode: .mass)
        }
        let volumeAction = UIAction (title:"Volume", image: UIImage(systemName: "drop.fill")) { (action) in
            self.selectMode (mode: .volume)
        }
        
        let menu = UIMenu (title: "Select Unit", children: [temperatureAction, lengthAction, massAction, volumeAction])
        modeSelection.menu = menu
        modeSelection.primaryAction = nil
    }
    
    func selectMode (mode: CalculatorModes) {
        calculatorModel.currentMode = mode
        self.title = calculatorModel.currentMode.rawValue + "Calculator"
        // "fatal error" here when trying to convert with volume
        metricLabel.text = units[calculatorModel.currentMode.rawValue]!["metric"]!
        imperialLabel.text = units[calculatorModel.currentMode.rawValue]!["imperial"]!
        convert(modeSelection!)
    }
    
}

