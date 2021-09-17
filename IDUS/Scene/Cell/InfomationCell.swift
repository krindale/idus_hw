//
//  DefaultCell.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import UIKit

final class InfomationCell: UITableViewCell {
    
    static let identifier: String = "InfomationCell"
    
    
    // title Label
    var titleLbl: UILabel = {
        var label = UILabel()
        return label
    }()
    
    // information Label
    var informationLbl: UILabel = {
        var label = UILabel()
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
        self.contentView.addSubview(self.titleLbl)
        self.contentView.addSubview(self.informationLbl)
        
        // Title Constrains
        self.titleLbl.snp.remakeConstraints {
            $0.left.equalToSuperview().inset(20.0)
            $0.centerY.equalToSuperview()
        }
        
        // Information Constrains
        self.informationLbl.snp.remakeConstraints {
            $0.right.equalToSuperview().inset(20.0)
            $0.centerY.equalToSuperview()
        }
    }
    
    // Bind Model
    func bind(title: String, information: String) {
        self.titleLbl.text = title
        self.informationLbl.text = information
    }
}
