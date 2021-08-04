//
//  DetailViewController.swift
//  Table
//
//  Created by 이상현 on 2021/08/02.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""
    // Main View 에서 받을 텍스트를 위해 변수 receiveItem을 선언합니다.
    @IBOutlet var lblItem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblItem.text = receiveItem
        // 뷰가 노출될 때마다 이 내용을 레이블의 텍스트로 표시합니다.

        // Do any additional setup after loading the view.
    }
    
    func receiveItem(_ item: String)
    {
        receiveItem = item
        // Main View에서 변수를 받기 위한 함수를 추가합니다.
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
