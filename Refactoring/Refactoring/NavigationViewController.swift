//
//  NavigationViewController.swift
//  Refactoring
//
//  Created by 이상현 on 2021/08/02.
//

import UIKit

class NavigationViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var text:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        label.text = text
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
