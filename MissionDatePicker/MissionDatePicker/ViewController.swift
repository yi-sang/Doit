//
//  ViewController.swift
//  MissionDatePicker
//
//  Created by 이상현 on 2021/07/23.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    // var alarmTime: String = "" 이렇게하면 시작과 동시에 깜빡임
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    let formatter1 = DateFormatter()
    let formatter = DateFormatter()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
//      데이트 피커를 선택할 때 발생하는 액션 함수인 changeDatePicker가 호출되면서 sender라는 UIDatePicker 자료형의 인수가 전달됩니다. 이 sender를 datePickerView라는 상수에 저장합니다.
        formatter1.dateFormat = "hh:mm aaa"
//      날짜를 출력하기 위하여 DateFormatter라는 클래스 상수 formatter를 선언합니다.
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
//      dateFormat 속성을 설정합니다.
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
//      lblPickerTime에 formatter의 "yyyy-MM-dd HH:mm EEE"형태의 dateFormat을 저장
        alarmTime = formatter1.string(from: datePickerView.date)
//        alarmTime의 변수에는 formatter1의 "hh:mm aaa"형태의 dateFormat을 저장
    }
    
    @objc func updateTime() {
        let date = NSDate() // 현재 시간을 date라는 상수에 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        let currentTime = formatter1.string(from: date as Date) // currentTime에 formatter1의 "hh:mm aaa"형태의 dateFormat을 저장
        if (alarmTime == currentTime){
            // 만약 시간이 같으면
            count += 1
            // 카운트를 해주며
            if (count % 2 == 0){
                // 짝수마다
                view.backgroundColor = UIColor.red
                // 배경화면을 붉은 색으로
            }
            else{
                // 홀수마다
                view.backgroundColor = UIColor.white
                // 배경화면을 흰 색으로
            }
        }
        else { // 이게 필요한 이유?
            view.backgroundColor = UIColor.white
            count = 0
        }
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        // 현재 시간 설정
    }

}

