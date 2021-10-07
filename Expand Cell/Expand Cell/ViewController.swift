//
//  ViewController.swift
//  Expand Cell
//
//  Created by User on 2021/10/07.
//

import UIKit

class ExpandCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
}


class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // Model
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    // Model Array
    var dataModels = [ExpandDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //테스트를 위한 description Array
        let textArray = ["short Text",
                         "long long long long long long long long long long long long long long long long long long long long Text",
                         "short Text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long long longlong long long long long long long long long long long long long long long long long long long long Text",
                         "short Text"
        ]
        
        for (_, value) in textArray.enumerated() {
            
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        // cell 클릭시 확장하도록 구현
        if dataModels[indexPath.row].isExpand == true {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        //cell 클릭시 회색으로 변하는 효과 삭제
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //클릭하면 해당 model의 isExpand 값을 뒤집는다.
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        //reloadData
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
        //tableView.reloadData()
    }

}

