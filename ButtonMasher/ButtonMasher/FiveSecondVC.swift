//
//  FiveSecondVC.swift
//  ButtonMasher
//
//  Created by The Dude on 10/17/23.
//

import UIKit

class FiveSecondVC: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timesPressedLabel: UILabel!
    @IBOutlet weak var buttonMash: UIButton!
    
    
    
    var seconds = 5
    var timer = Timer()
    var isTimerRunning = false
    var timesPressedCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        timesPressedLabel.text = ("Times Pressed: 0")
        timesPressedCount = 0
        buttonMash.isEnabled = false
        

        // Do any additional setup after loading the view.
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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timeLabel.text = "\(seconds) seconds"
        if (seconds <= 0) {
            timer.invalidate()
            self.performSegue(withIdentifier: "finalSegue", sender: self)
            startButton.isEnabled = true
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let finalVC = segue.destination as! FinalVC
        finalVC.infoLabelText1 = ("You pressed the button \(timesPressedCount) times")
        finalVC.infoLabelText2 = ("In 5 seconds")
    }
    

}
