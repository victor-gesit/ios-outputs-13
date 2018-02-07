//
//  ViewController.swift
//  Output13
//
//  Created by Victor Idongesit on 09/12/2017.
//  Copyright © 2017 Victor Idongesit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pricingLabel: UILabel!
    @IBOutlet weak var convertTextLabel: UILabel!
    @IBOutlet weak var aboutBTCLabel: UILabel!
    @IBOutlet weak var dollarValue: UITextField!
    @IBOutlet weak var btcValue: UITextField!
    @IBOutlet weak var aboutBTCTextView: UITextView!
    private var bitcoinPrice = 17255.5
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let calendar = Calendar.current
        var timeOfDay: String
        let hour = calendar.component(.hour, from: date)
        switch hour {
            case 0...11: timeOfDay = "morning"
            case 12...15: timeOfDay = "afternoon"
            case 16...23: timeOfDay = "evening"
            default: timeOfDay = "morning"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let time = dateFormatter.string(from: date)
        let greeting = NSLocalizedString(timeOfDay, comment: "Greeting")
        timeLabel.text = "\(time)\n\(greeting)"
        aboutBTCLabel.text = NSLocalizedString("aboutBTCLabel", comment: "About Blockchain")
        convertTextLabel.text = NSLocalizedString("convertLabel", comment: "Convert String")
        pricingLabel.text = NSLocalizedString("pricingLabel", comment: "Pricing Label") + "$\(bitcoinPrice)"
        aboutBTCTextView.text = NSLocalizedString("aboutBTCTextView", comment: "About BTC TextView")
        
    }
    @IBAction func btcToDollar(_ sender: Any) {
        if let string = btcValue.text, let float = Double(string) {
            print("Happening here")
            dollarValue.text = String(float * bitcoinPrice)
        } else {
            print("Not happening")
            dollarValue.text = "0"
        }
    }
    @IBAction func dollarToBTC(_ sender: Any) {
        if let string = dollarValue.text, let float = Double(string) {
            btcValue.text = String(float / bitcoinPrice)
        } else {
            btcValue.text = "0"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
