//
//  PagingImageViewCell.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import UIKit
import FSPagerView

final class PagingImageViewCell: UITableViewCell {
    
    static let identifier: String = "PagingImageViewCell"
    
    var imageURLs: [String] = []
    
    var pagerView: FSPagerView = {
        var pagerView = FSPagerView()
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.itemSize = FSPagerView.automaticSize
        return pagerView
    }()
    
    var pageControl: FSPageControl = {
        var pageControl = FSPageControl()
        pageControl.contentHorizontalAlignment = .center
        pageControl.setFillColor(.orange, for: .selected)
        pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return pageControl
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
        self.contentView.addSubview(self.pagerView)
        self.contentView.addSubview(self.pageControl)
        
        self.pagerView.delegate = self
        self.pagerView.dataSource = self

        // PagerView Constrains
        self.pagerView.snp.remakeConstraints {
            $0.top.left.right.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(20.0)
            $0.height.height.greaterThanOrEqualTo(300.0)
        }
        
        // Page Control Constrains
        self.pageControl.snp.remakeConstraints {
            $0.bottom.equalToSuperview().inset(10.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    // Bind Model
    func bind(imageURLs: [String]) {
        self.imageURLs = imageURLs
        pagerView.reloadData()
        pageControl.numberOfPages = self.imageURLs.count
    }

}

extension PagingImageViewCell: FSPagerViewDataSource, FSPagerViewDelegate {
    
    // MARK:- FSPagerView DataSource
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageURLs.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.setImage(imageURL:self.imageURLs[index])
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
}
