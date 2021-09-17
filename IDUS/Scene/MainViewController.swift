//
//  MainViewController.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources
import ReactorKit

final class MainViewController: UIViewController, View {

    
    // Init TableView
    lazy var tableView: UITableView = {
        return self.setTableView()
    }()
    
    // Rx DisposeBag
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setRx()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 여기는 사용하지 않는 거로
        self.setConstraints()
    }
    
    
    func bind(reactor: MainReactor) {
        
        // state (Reactor -> View)
        // Set TableView DataSource
        reactor.state.map { $0.sections }
            .bind(to: self.tableView.rx.items(dataSource: setDataSource()))
            .disposed(by: self.disposeBag)
        
        // Loading First
        reactor.action.onNext(.fetchData(id: IDUSAPI.id))
    }
    
    private func setRx() {
        
        // Set TableView Delegate
        self.tableView.rx
            .setDelegate(self)
            .disposed(by: self.disposeBag)

        // Extension Cell
        self.tableView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let cell = self?.tableView.cellForRow(at: indexPath) as? ExtendableCell
                else { return }
                cell.descriptionLbl.isHidden = !cell.descriptionLbl.isHidden
                self?.tableView.reloadData()
                
            }).disposed(by: self.disposeBag)
    }
    
}

extension MainViewController: UITableViewDelegate {
    // Select Effect 제거
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
