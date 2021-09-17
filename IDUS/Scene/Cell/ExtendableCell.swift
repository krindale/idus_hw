//
//  ExtendableCell.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import UIKit

class ExtendableCell: UITableViewCell {
    
    static let identifier: String = "ExtendableCell"
    
    var stackView: UIStackView = {
       var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
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
        self.contentView.addSubview(self.stackView)
        
        // Stack View Constrains
        self.stackView.snp.remakeConstraints {
            $0.edges.equalToSuperview().inset(20.0)
        }
        
        self.stackView.addArrangedSubview(self.informationLbl)
        self.stackView.addArrangedSubview(self.descriptionLbl)
    }
    
    // Bind Model
    func bind(title: String, information: String, description: String) {
        self.titleLbl.text = title
        self.informationLbl.text = information
        self.descriptionLbl.text = description
    }
}
