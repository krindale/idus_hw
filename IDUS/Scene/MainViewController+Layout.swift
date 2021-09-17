//
//  MainViewController+Layout.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import Foundation
import UIKit

// Layout
extension MainViewController {
    
    // init TableView
    func setTableView() -> UITableView {
        let tableView = UITableView()

        tableView.allowsSelection = true
        
        // Register TableView Cell
        tableView.register(PagingImageViewCell.self,
                           forCellReuseIdentifier: PagingImageViewCell.identifier)
        tableView.register(InfomationCell.self,
                           forCellReuseIdentifier: InfomationCell.identifier)
        tableView.register(ExtendableCell.self,
                           forCellReuseIdentifier: ExtendableCell.identifier)
        tableView.register(DescriptionCell.self,
                           forCellReuseIdentifier: DescriptionCell.identifier)
        tableView.register(CategoryCell.self,
                           forCellReuseIdentifier: CategoryCell.identifier)
        
        return tableView
    }
    
    // Set Base UI
    func setUI() {
        // Main Title
        self.navigationItem.title = "아이디어스(idus)"
        // Set Default UI
        self.view.backgroundColor = .white
        // add TableView
        self.addUIComponents()
    }
    
    // Add UI Components to View
    private func addUIComponents() {
        self.view.addSubview(self.tableView)
    }

    
    // Set Constraints
    func setConstraints() {
        // Set TableView Constraints
        tableView.snp.remakeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}
