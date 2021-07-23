//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이상현 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lb1Hello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: UIButton) {
        lb1Hello.text = "Hello, " + txtName.text!
    }
}

