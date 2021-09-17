//
//  CategoryCell.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import UIKit

final class CategoryCell: UITableViewCell {

    static let identifier: String = "CategoryCell"

    // Category Title Label
    var categoryTitleLbl: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // Category StackView For Category Label
    var categoryStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // Init Cell UI
    private func setUI() {
        // Add Subviews
        self.contentView.addSubview(self.categoryTitleLbl)
        self.contentView.addSubview(self.categoryStackView)
        
        // Category Title Constrains
        self.categoryTitleLbl.snp.remakeConstraints {
            $0.top.left.right.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(40.0)
        }
        
        // Category StackView Constrains
        self.categoryStackView.snp.remakeConstraints {
            $0.top.equalTo(self.categoryTitleLbl.snp.bottom).inset(20.0)
            $0.left.bottom.equalToSuperview().offset(10.0)
        }
        
        self.categoryTitleLbl.text = "카테고리"
    }
    
    // Bind Model
    func bind(categories: [String]) {
        // Remove All Subviews in StackView
        self.categoryStackView.removeAllArrangedSubviews()
        // Add Category Labels in StackView
        self.categoryStackView.addCatetoryLbl(categories: categories)
    }
}

fileprivate extension UIStackView {
    
    // Add Category Labels
    func addCatetoryLbl(categories: [String]) {
        categories.forEach{ [weak self] category in
            let categoryLbl = UILabel()
            categoryLbl.text = "#" + category
            self?.addArrangedSubview(categoryLbl)
        }
    }
}
