//
//  BirthDatePickerViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/04.
//

import UIKit

protocol NickNameDelegate {
    func didNickNameSave (_ controller: BirthDatePickerViewController, message: String)
    }

class BirthDatePickerViewController: UIViewController {
    
    var textName: String = ""
    var delegate: NickNameDelegate?
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var datePickerBirth: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = textName + "님,"

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
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
