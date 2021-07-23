//
//  ViewController.swift
//  missionImgView
//
//  Created by 이상현 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {
    var maxImage:Int = 4 // 사진 개수
    var numImage:Int = 1 // 사진 이름 초기값
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var switchResize: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnPrevImg(_ sender: UIButton) {
        numImage -= 1 // Prev label이 눌렸을 때 사진 이름을 -1 해준다.
        if (numImage < 1) { // 1보다 작아지면
            numImage = maxImage // maxImage가 되도록 해서 계속 회전하도록 한다.
        }
        let imageName = String(numImage) + ".jpeg"
//      imageName에 문자열로 이미지 이름을 넣어준다.
        imgView.image = UIImage(named: imageName)
//      이미지 뷰의 아웃렛 변수 imgView에 이미지를 지정한다.
    }
    @IBAction func btnNextImg(_ sender: UIButton) {
        numImage += 1 // Next label이 눌렸을 때 사진 이름을 +1 해준다.
        if (numImage > maxImage) { // maxImage 값보다 커지면 1로 가도록 한다.
            numImage = 1
        }
        let imageName = String(numImage) + ".jpeg"
        imgView.image = UIImage(named: imageName)
    }
    @IBAction func swtichResizeImg(_ sender: UISwitch) {
        let scale:CGFloat = 2.0 // scale 변경 배수
        var newWidth:CGFloat, newHeight:CGFloat // 타입 설정
        if sender.isOn { // 스위치가 켜졌을 때
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
        }
        else { // 스위치가 꺼졌을 때
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        // imgView의 사이즈에 변경값을 넣어준다.
    }
    

}

