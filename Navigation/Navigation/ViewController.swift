//
//  ViewController.swift
//  Navigation
//
//  Created by 이상현 on 2021/07/31.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    var originZoom = false
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        // 첫 화면
    }
    override func prepare(for seque: UIStoryboardSegue, sender: Any?){
        let editViewController = seque.destination as! EditViewController
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = originZoom
        editViewController.delegate = self
        if seque.identifier == "editButton" {
            // 버튼을 클릭한 경우
            editViewController.textWayValue = "seque : use button"
        } else if seque.identifier == "editBarButton" {
            // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "seque : use Bar button"
        }
        
    }
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    func didImageOnOff(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if isZoom {
            if originZoom {
                
            } else {
                self.isZoom = false
                self.originZoom = true
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        } else {
            if originZoom  {
                self.isZoom = true
                self.originZoom = false
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
        }
        
    }
    
}

