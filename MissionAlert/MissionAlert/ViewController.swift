//
//  ViewController.swift
//  MissionAlert
//
//  Created by 이상현 on 2021/07/24.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    var flag = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
//      데이트 피커를 선택할 때 발생하는 액션 함수인 changeDatePicker가 호출되면서 sender라는 UIDatePicker 자료형의 인수가 전달됩니다. 이 sender를 datePickerView라는 상수에 저장합니다.
        let formatter = DateFormatter()
//      날짜를 출력하기 위하여 DateFormatter라는 클래스 상수 formatter를 선언합니다.
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
//      dateFormat 속성을 설정합니다.
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
//      lblPickerTime에 formatter의 "yyyy-MM-dd HH:mm EEE"형태의 dateFormat을 저장
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
//        alarmTime의 변수에는 formatter의 "hh:mm aaa"형태의 dateFormat을 저장
    }
    
    @objc func updateTime() {
        let date = NSDate() // 현재 시간을 date라는 상수에 선언
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
//      currentTime에 formatter의 "hh:mm aaa"형태의 dateFormat을 저장
        
        if (alarmTime == currentTime){ // 알람시간과 현재시간이 같을 때
            if !flag { // flag가 false라면
                count += 1
                if count % 2 == 1{
                    view.backgroundColor = UIColor.red
                }
                else {
                    view.backgroundColor = UIColor.white
                }
                let alarmOnAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
                // 알람
                let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {
                    ACTION in
                    self.flag = true
                    self.view.backgroundColor = UIColor.white
                })
                alarmOnAlert.addAction(onAction)
                // 생성된 onAction을 얼럿에 추가합니다.
                present(alarmOnAlert, animated: true, completion: nil)
                // present 메서드 실행합니다.
                
            }
        } else {
            flag = false
            count = 0
            view.backgroundColor = UIColor.white
        }
    }
}
