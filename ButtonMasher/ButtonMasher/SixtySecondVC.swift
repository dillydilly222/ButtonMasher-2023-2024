//
//  SixtySecondVC.swift
//  ButtonMasher
//
//  Created by The Dude on 10/25/23.
//

import UIKit

class SixtySecondVC: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var buttonMash: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timesPressedLabel: UILabel!
    
    var seconds = 15.00
    var timer = Timer()
    var isTimerRunning = false
    var timesPressedCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        timesPressedLabel.text = ("Times Pressed: 0")
        timesPressedCount = 0
        buttonMash.isEnabled = false
    }
    
    @IBAction func increaseTotalClicks(_ sender: UIButton) {
        timesPressedCount += 1
        timesPressedLabel.text = ("Times Pressed: \(timesPressedCount)")
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        runTimer()
        startButton.isEnabled = false
        buttonMash.isEnabled = true;
    }
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if (seconds <= 0.00) {
            timer.invalidate()
            self.performSegue(withIdentifier: "finalSegue", sender: self)
            startButton.isEnabled = true
            timeLabel.text = "0.00"
        } else {
            seconds -= 0.01
            let roundedSeconds = NSString(format: "%.2f", seconds)
            timeLabel.text = "\(roundedSeconds)"
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let finalVC = segue.destination as! FinalVC
        finalVC.infoLabelText1 = ("You pressed the button \(timesPressedCount) times")
        finalVC.infoLabelText2 = ("In 60 seconds")
    }
    

}
