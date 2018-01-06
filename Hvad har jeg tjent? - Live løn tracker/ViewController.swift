//
//  ViewController.swift
//  Hvad har jeg tjent? - Live løn tracker
//
//  Created by Frederik Søndergaard Jensen on 02/12/2017.
//  Copyright © 2017 Frederik Søndergaard Jensen. All rights reserved.
//

import UIKit

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var startWorkButton: UIButton!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var earningsLabel: UILabel!
    
    var timer = Timer()
    var clickTime : Double = 0.0
    var isWorking : Bool = false
    var earnings : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startWorkButtonClicked(_ sender: Any) {
        if (isWorking == true) {
            startWorkButton.setTitle("START", for: .normal)
            stopTimer()
            isWorking = false
        }   else {
            clickTime = Date().timeIntervalSinceReferenceDate
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            startWorkButton.setTitle("STOP", for: .normal)
            isWorking = true
        }
    }
    
    func stopTimer(){
        timer.invalidate()
    }
    
    @objc func runTimer(timeStart: Double){
        let currentTime = Date().timeIntervalSinceReferenceDate
        let timeSpendWorking = Int(currentTime) - Int(clickTime)
        hourLabel.text = timeSpendWorking.description
        earningsLabel.text = String(calculateEarnings(time: timeSpendWorking))
    }
    

    
    
    func calculateEarnings(time: Int) -> String {
        let salary = 110.0
        let salarySecond = salary/3600.0
        earnings = salarySecond + earnings
        return String(earnings.roundTo(places: 2))
    }
    
}
//earnings2 = earnings2 + Double(salarySecond).roundTo(places: 2)

