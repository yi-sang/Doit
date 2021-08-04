//
//  TableViewController.swift
//  Table
//
//  Created by 이상현 on 2021/08/02.
//

import UIKit

var items = ["책구매", "철수와 약속", "스터디 준비하기"]
// 외부 변수인 items의 내용을 각각 지정합니다.
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]
// 외부 변수인 이미지 파일이름을 지정합니다.
class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // edit로 삭제 버튼
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
        // tvListView.reloadData 함수를 추가하여 테이블 뷰를 다시 불러옵니다. 다시 말해 추가된 내용을 목록으로 불러들입니다.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        // 보통은 테이블 안에 섹션이 한개이므로
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
        // 섹션당 열의 개수는 items의 개수이므로
    }

    // 셀에 적용하는 함수
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        // 앞에 선언한 items를 대입합니다.
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
        // 셀의 이미지 뷰에서 선언한 itemsImageFile을 대입합니다.
        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    // 드래그로 삭제
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            // 선택한 셀을 삭제하는 코드
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    // delete를 삭제로 변경
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // 목록 옮기기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        // 이동할 아이템의 위치를 저장
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        // 이동할 아이템의 이미지를 itemImageTOmove에 저장
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        // 이동할 아이템들을 삭제합니다 이때 삭제한 아이템 뒤의 아이템들의 인덱스가 재정렬됩니다.
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        // 이동할 아이템의 이미지를 삭제합니다. 이때 삭제한 아이템 뒤의 아이템 이미지들의 인덱스가 재정렬됩니다.
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        // 삭제할 아이템을 이동할 위치로 삽입합니다. 이때 삭제한 아이템 뒤의 아이템들의 인덱스가 재정렬됩니다.
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        // 삭제할 아이템의 이미지를 이동할 위치로 삽입합니다. 이때 삭제한 아이템 뒤의 아이템 이미지들의 인덱스가 재정렬됩니다.

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation
    // 세그웨이를 이용하여 뷰를 이동하는 함수
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
    }
    

}
