//
//  ViewController.swift
//  MissionMap
//
//  Created by 이상현 on 2021/07/30.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate { // 델리게이트 선언

    @IBOutlet var myMap: MKMapView!
    // MapKit import해줘야 함
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager() //변수 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        // 위치 정보를 표시할 레이블 초기화
        locationManager.delegate = self
        // 델리게이트를 self로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization()
        // 위치 데이터를 추적하기 위해 사용자에게 승인을 요구합니다.
        locationManager.startUpdatingLocation()
        // 위치 업데이트를 시작합니다.
        myMap.showsUserLocation = true
        // 위치 보기 값을 true로 설정합니다.
    }
    // 지도를 나타내기 위해서
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double)-> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        // 위도 값과 경도 값을 매개변수로 하여 CLLocation Coordinate2DMake 함수를 호출하고, 리턴 값을 pLocation으로 받습니다.
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        // 범위 값을 매개변수로 하여 MKCoordinateSpanMake 함수를 호출하고, 리턴 값을 spanValue로 받습니다.
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        // pLocation과 spanValue 값을 매개변수로 하여 MKCoordinateRegionMake 함수를 호출하고, 리턴 값을 pRegion으로 받습니다ㅓ.
        myMap.setRegion(pRegion, animated: true)
        // pRegion 값을 매개변수로 하여 myMap.setRegion 함수를 호출합니다.
        return pLocation
        // CLLocationCoordinate2D 형태로 리턴합니다.
    }
    // 핀 설정
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        // 핀을 설치하기 위해MKPointAnnotation 함수를 호출하여 리턴 값을 annotation으로 받습니다.
        annotation.coordinate =  goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        // annotation의 coordinate 값을 goLocation함수로부터 CLLocationCoordinate2D형태로 받아야 하는데, 이를 위해서는 goLocation 함수를 수정해야 합니다.
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    // 위치가 업데이트되었을 때 지도에 위치를 나타내기 위해 함수를 추가
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        // 마지막 위치 값을 찾아냄
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        // 마지막 위치의 위도와 경도값을 가지고 앞에서 만든 goLocation함수를 호출, 이때 delta 값은 지도의 크기를 결정하는 데 값이 작을 수록 크게 확대 된다.  0.01 = 100배
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            // 익명 함수
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            // placemarks 값의 첫 부분만 pm 상수로 대입합니다.
            let country = pm!.country
            // pm 상수에서 나라 값을 country 상수에 대입합니다.
            var address:String = country!
            // 문자열 address에 country 상수의 값을 대입합니다.
            if pm!.locality != nil {
                // pm 상수에서 지역 값이 존재하면 address 문자열에 추가합니다.
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                // pm상수에서 도로 값이 존재하면 address 문자열에 추가합니다.
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            })
        locationManager.stopUpdatingLocation()
        // 마지막으로 위치가 업데이트 되는 것을 멈춥니다.
    }
    // 세그먼트 컨트롤
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // 현재 위치
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
          
        } else if sender.selectedSegmentIndex == 1 {
            // 폴리텍대학 표시
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            // 이지스퍼블리싱 표시
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        }
        else if sender.selectedSegmentIndex == 3 {
            // 우리집 표시
            setAnnotation(latitudeValue: 37.47770891820561, longitudeValue: 126.70445088838616, delta: 0.1, title: "우리집", subtitle: "인천광역시 부평구 아트센터로118")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리집"
        }
    }
    
}









