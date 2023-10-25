//
//  FinalVC.swift
//  ButtonMasher
//
//  Created by The Dude on 10/25/23.
//

import UIKit

class FinalVC: UIViewController {
    
    @IBOutlet weak var infoLabel1: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    
    var infoLabelText1 = " "
    var infoLabelText2 = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel1.text = infoLabelText1
        infoLabel2.text = infoLabelText2
        // Do any additional setup after loading the view.
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
