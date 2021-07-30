//
//  ViewController.swift
//  MissionWeb
//
//  Created by 이상현 on 2021/07/28.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    // 델리게이트
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
       let myUrl = URL(string: url)
        // 상수 myUrl은 url값을 받아 URL형으로 선언합니다.
       let myRequest = URLRequest(url: myUrl!)
        // 상수 myRequest는 상수 myUrl을 받아 URLRequest형으로 선언합니다.
       myWebView.load(myRequest)
        // UIWebView형의 myWebView 클래스의 load메서드를 호출합니다.
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        // 파일에 대한 경로 변수를 생성
        let myUrl = URL(fileURLWithPath: filePath!)
        // url 변수를 생성
        let myRequest = URLRequest(url: myUrl)
        // request 변수를 생성
        myWebView.load(myRequest)
        // request변수를 이용하여 HTML 파일을 로딩합니다.
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // 로딩 중일 때 인디케이터를 실행하고 화면에 나타나게 합니다.
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 로딩이 완료되었을 때 인디케이터를 중지하고 숨김
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        // 로딩이 실패했을 때 인디케이터를 중지하고 숨킴
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    // 문자열을 자동으로 삽입하는 코드 추가하기
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        // 입력받은 url 스트링을 임시 변수 strUrl에 넣습니다.
        let flag = strUrl.hasPrefix("http://")
        // http:// 를 가지고 있는지 확인한 값을 flag에 넣습니다.
        if !flag {
            // 없다면
            strUrl = "http://" + strUrl
            // 추가해줍니다.
        }
        return strUrl
        // str 형태의 url을 리턴합니다.
    }

}

