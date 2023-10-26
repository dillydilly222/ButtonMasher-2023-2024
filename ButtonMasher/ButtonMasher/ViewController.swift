//
//  ViewController.swift
//  ButtonMasher
//
//  Created by The Dude on 10/16/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let FinalVC = segue.source as! FinalVC
    }


}

