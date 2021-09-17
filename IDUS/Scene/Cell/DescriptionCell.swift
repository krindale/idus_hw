//
//  DescriptionCell.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import UIKit

final class DescriptionCell: UITableViewCell {

    static let identifier: String = "DescriptionCell"

    // Description Label
    var descriptionLbl: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
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
        self.contentView.addSubview(self.descriptionLbl)
        
        // Description Constrains
        self.descriptionLbl.snp.remakeConstraints {
            $0.top.left.right.bottom.equalToSuperview().inset(20.0)
        }
    }
    
    // Bind Model
    func bind(description: String) {
        self.descriptionLbl.text = description
    }
}
