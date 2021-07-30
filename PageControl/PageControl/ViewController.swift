//
//  ViewController.swift
//  PageControl
//
//  Created by 이상현 on 2021/07/31.
//

import UIKit
var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        // 페이지 컨트롤의 전체페이지 수
        pageControl.currentPage = 0
        // 현재 페이지
        pageControl.pageIndicatorTintColor = UIColor.green
        // 페이지 컨트롤의 페이지를 표시하는 부분의 색상을 의미합니다. UIColor.green을 입력하면 페이지를 표시하는 페이지 컨트롤의 전체 동그라미 부분이 초록색으로 표시됩니다.
        pageControl.currentPageIndicatorTintColor = UIColor.red
        // 현재 페이지가 빨간색으로 표시됩니다.
        imgView.image = UIImage(named: images[0])
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
        // 페이지 컨트롤의 현재 페이지를 가지고 와서 현재 페이지에 해당하는 이미지 파일의 이름을 images 배열에서 가져옵니다.
        // UIImage 타입의 이미지를 만들어 이미지를 이미지 뷰에 할당합니다.
    }
    

}

