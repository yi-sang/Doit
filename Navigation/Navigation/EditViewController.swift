//
//  EditViewController.swift
//  Navigation
//
//  Created by 이상현 on 2021/07/31.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOff(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    // 수정화면에서 직접 텍스트 필드의 텍스트를 제어할 수 없기 때문에 변수 textMessage를 문자열로 만듭니다.
    var isOn = false
    // 수정화면에서 직접 스위치를 제어할 수 없기 때문에 변수를 생성합니다.
    var isZoom = false
    // 수정화면에서 직접 버튼을 제어할 수 없기 때문에 변수를 생성합니다.
    
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        // viewDidLoad 함수에서 변수 textMessage 값을 텍스트 필드의 텍스트로 대입하여 텍스트 필드에 나타나게 합니다.
        swIsOn.isOn = isOn
        // isOn의 값을 스위치의 On에 대입하여 스위치 값에 출력되게 합니다.
        if isZoom {
            btnResize.setTitle("확대", for: UIControl.State())
        } else {
            btnResize.setTitle("축소", for: UIControl.State())
        }
    }
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            // didMessageEditDone을 호출하면서 수정화면의 텍스트 필드 내용을 메시지 문자열로 전달합니다.
            // 수정화면의 텍스트 필드의 내용을 메인화면으로 전달합니다.
            delegate?.didImageOnOff(self, isOn: isOn)
            // 수정화면의 스위치 상태를 메인화면으로 전달
            delegate?.didImageZoomDone(self, isZoom: isZoom)
            // 수정화면의 버튼 상태를 메인화면으로 전달
        }
        _ = navigationController?.popViewController(animated: true)

    }

    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    @IBAction func btnResizeImage(_ sender: UIButton) {
        if (isZoom) {   // true
            btnResize.setTitle("축소", for: .normal)
        }
        else {  //false
            btnResize.setTitle("확대", for: .normal)
        }
        isZoom = !isZoom
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
