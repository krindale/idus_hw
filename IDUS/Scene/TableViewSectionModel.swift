//
//  TableViewSectionModel.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

typealias TableViewSectionModel = SectionModel<Void, TableViewCellSections>

enum TableViewCellSections {
    case screenShotImages(imageURLs: [String])
    case fileSize(title: String, fileSize: String)
    case updatedInfo(title: String, information: String, description: String)
    case descriptionCell(description: String)
    case categoryCell(categories: [String])
}
