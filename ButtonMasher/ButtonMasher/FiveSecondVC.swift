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
    
    
    
    var seconds = 5
    var timer = Timer()
    var isTimerRunning = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func increaseTotalClicks(_ sender: UIButton) {
        
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        runTimer()
        startButton.isEnabled = false
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
