//
//  MainReactorKit.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import Foundation
import ReactorKit

final class MainReactor: Reactor {
    
    // MARK: - Property
    let initialState: State

    // MARK: - Constants
    enum Action {
        case fetchData(id: Int)
    }

    enum Mutation {
        case setModel(model: IDUSModel)
    }

    struct State {
        var sections: [TableViewSectionModel]
    }

    init() {
        self.initialState = State(sections: [])
    }

    // MARK: - func
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {

        case let .fetchData(id):
            return APIManager.share.request(target: .appStoreLookup(id: id))
                .map(IDUSModel.self)
                .asObservable()
                .map {.setModel(model: $0)}
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        
        case .setModel(let model):
            newState.sections = configSections(model: model)
        }
        return newState
    }

    
    // Configure Sections
    func configSections(model: IDUSModel) -> [TableViewSectionModel] {
        var sections: [TableViewSectionModel] = []
        
        guard let result = model.results.first else { return []}
        
        let section: [TableViewCellSections] = [
            // Screen Shot Images Cell
            .screenShotImages(imageURLs: result.screenshotUrls),
            // File Size
            .fileSize(title: "크기", fileSize: result.fileSizeBytes.byteToMB),
            // Update Info
            .updatedInfo(title: "새로운 기능", information: result.version, description: result.releaseNotes),
            // Description Cell
            .descriptionCell(description: result.resultDescription),
            // Category Cell
            .categoryCell(categories: result.genres)
        ]
        sections.append(TableViewSectionModel(model: Void(), items: section))
        
        return sections
    }
    
}
