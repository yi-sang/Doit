//
//  ViewController.swift
//  MissionPickerView
//
//  Created by 이상현 on 2021/07/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//  UIPickerViewDelegate class와 UIPickerViewDataSource class 상속받기
    let MAX_ARRAY_NUM = 5 // 사진 개수
    let PICKER_VIEW_COLUMN = 2 // pickerView 열 개수
    let PICKER_VIEW_HEIGHT: CGFloat = 80 // pickerView 높이
    var imageArray = [UIImage?]() // image 배열
    var imageFileName = ["1.png", "2.png", "3.png", "4.png", "5.png"]
    // image 이름
    var imageRealFileName = ["가라테", "서핑", "스포츠클라이밍", "스케이트보딩", "야구, 소프트볼"]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM { // for문 사진 개수 이하
            let image = UIImage(named: imageFileName[i]) // 이미지를 배열에 넣기
            imageArray.append(image) // push
        }
        
        lblImageFileName.text = imageRealFileName[0] // label 초기 실행화면
        imageView.image = imageArray[0] // pickerView 초기 실행화면
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN // 피커 뷰에게 컴포넌트(열)의 수를 넘겨준다.
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT // 컴포넌트의 높이를 정수 값으로 넘겨준다.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count // 피커 뷰에게 컴포넌트의 행의 수를 넘겨준다.
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row] // 열의 타이틀을 문자열 값으로 넘겨준다.
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//      피커 뷰에 파일명대신 이미지 출력하기
        let imageView = UIImageView(image: imageArray[row])
        // 새로운 이미지뷰에 imageArray에서 선택된 row에 해당하는 이미지를 가져옴
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        // 프레임 크기를 설정한다.
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent componet: Int) {
//      1열에는 이미지 출력
        if (componet == 1) {
            imageView.image = imageArray[row]
//          imageView에 선택한 이미지 출력
        }
//      0열에는 이미지 설명 출력
        else {
//            lblImageFileName.text = imageFileName[row]
            lblImageFileName.text = imageRealFileName[row]
//          label에 선택한 이미지 설명 출력
        }
    }

}

