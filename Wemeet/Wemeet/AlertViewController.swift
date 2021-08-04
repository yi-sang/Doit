//
//  AlertViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/04.
//

import UIKit
protocol BirthDayDelegate {
    func didBirthDaySave (_ controller: BirthDatePickerViewController, message: String)
    }

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
