//
//  MainViewController+DataSource.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

extension MainViewController {
    
    func setDataSource() -> RxTableViewSectionedReloadDataSource< TableViewSectionModel> {
        
        let dataSource = RxTableViewSectionedReloadDataSource<TableViewSectionModel>(configureCell: { dataSource, tableView, indexPath, sectionItems in

            switch sectionItems {
            case let .screenShotImages(imageURLs):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PagingImageViewCell.identifier, for: indexPath) as? PagingImageViewCell
                else {
                    return UITableViewCell()
                }
                cell.bind(imageURLs: imageURLs)
                return cell
                
            case let .fileSize(title, infomation):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: InfomationCell.identifier, for: indexPath) as? InfomationCell
                else {
                    return UITableViewCell()
                }
                cell.bind(title: title, information: infomation)
                return cell
                
            case let .updatedInfo(title, information, description):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ExtendableCell.identifier, for: indexPath) as? ExtendableCell
                else {
                    return UITableViewCell()
                }
                cell.bind(title: title, information: information, description: description)
                return cell
                
            case let .descriptionCell(description):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath) as? DescriptionCell
                else {
                    return UITableViewCell()
                }
                cell.bind(description: description)
                return cell
                
            case let .categoryCell(categories):
                guard let cell = tableView.dequeueReusableCell(withIdentifier:CategoryCell.identifier,
                                                         for: indexPath) as? CategoryCell
                else {
                    return UITableViewCell()
                }
                
                cell.bind(categories: categories)
                return cell
            }
        })
        
        return dataSource
    }
}
