//
//  CommonList.swift
//  geekTimeSwiftUI
//
//  Created by Ben Lv on 2020/2/8.
//  Copyright © 2020 ruibo. All rights reserved.
//




import Foundation
import UIKit


class CommonListCell<ItemType>: UITableViewCell {
    var item: ItemType?
    required  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol CommonListDelegate:AnyObject {
    func didSelectItem<Item>(_ item: Item)
}


class CommonList<ItemType,CellType:CommonListCell<ItemType>>: UIView,UITableViewDataSource,UITableViewDelegate {
   
    var tableView: UITableView
    var items: [ItemType]! = []{
        didSet {
            self.tableView.reloadData()
            
        }
    }
    
    weak var delegate: CommonListDelegate?
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .plain)
//        items = []
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:CellType? = tableView.dequeueReusableCell(withIdentifier: "cellId") as? CellType
           if cell == nil {
            cell = CellType(style: .subtitle, reuseIdentifier: "cellId")
           }
           cell?.item = items[indexPath.row]
           return cell!
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
