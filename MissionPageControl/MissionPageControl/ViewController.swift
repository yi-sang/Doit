//
//  ViewController.swift
//  MissionPageControl
//
//  Created by 이상현 on 2021/07/31.
//

import UIKit

let NUM_PAGE = 10

class ViewController: UIViewController {
    @IBOutlet var lblPageNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        pageControl.numberOfPages = NUM_PAGE
        // 페이지 컨트롤의 전체페이지 수
        pageControl.currentPage = 0
        // 현재 페이지
        pageControl.pageIndicatorTintColor = UIColor.green
        // 페이지 컨트롤의 페이지를 표시하는 부분의 색상을 의미합니다. UIColor.green을 입력하면 페이지를 표시하는 페이지 컨트롤의 전체 동그라미 부분이 초록색으로 표시됩니다.
        pageControl.currentPageIndicatorTintColor = UIColor.red
        // 현재 페이지가 빨간색으로 표시됩니다.
        lblPageNumber.text = String(pageControl.currentPage+1)
        // 라벨 글자를 페이지컨트롤의 현재페이지 + 1로 선언
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        lblPageNumber.text = String(pageControl.currentPage+1)
        // 라벨 글자를 페이지컨트롤의 현재페이지 + 1로 선언
    }
}

