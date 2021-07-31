//
//  ViewController.swift
//  MissionTab
//
//  Created by 이상현 on 2021/07/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func btnMovePickerVIew(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    

}

