//
//  DealListViewController.swift
//  geekTimeSwiftUI
//
//  Created by Ben Lv on 2020/2/8.
//  Copyright © 2020 ruibo. All rights reserved.
//

import UIKit

class DealListViewController: BaseViewController,CommonListDelegate {
    func didSelectItem<Item>(_ item: Item) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productList = CommonList<Deal,DealListCell>(frame: .zero)
        productList.items = FakeData.createDeals()
        productList.delegate = self
        view.addSubview(productList)
        productList.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        
    }
    

    

}
