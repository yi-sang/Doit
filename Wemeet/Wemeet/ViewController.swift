//
//  ViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/04.
//

import UIKit

class ViewController: UIViewController, NickNameDelegate {
    
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSend(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let BirthDatePickerViewController = segue.destination as! BirthDatePickerViewController
        if segue.identifier == "sgNickNameButton" {
            BirthDatePickerViewController.textName = txtName.text!
            BirthDatePickerViewController.delegate = self
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
    }
    func didNickNameSave (_ controller: BirthDatePickerViewController, message: String) {
        txtName.text = message
    }
        
}

