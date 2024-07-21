//
//  TravelTalkListViewController.swift
//  MessengerSetting
//
//  Created by 김윤우 on 7/19/24.
//

import UIKit
import SnapKit

enum Sections: CaseIterable{
    case main
}


class TravelTalkListViewController: BaseViewcontroller {
    let searchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "친구 이름을 검색해보세요"
        return searchBar
    }()
    
   lazy var collectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        return collectionView
    }()
    
    func createLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    var dataSource: UICollectionViewDiffableDataSource<Int, Friend>!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        
    }
    override func setUpHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
    }
    
    override func setUpLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    override func setupNavigationItem() {
        navigationItem.title = "TRAVEL TALK"
    }
    private func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, Friend>
        registration = UICollectionView.CellRegistration{ cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.font = UIFont.boldSystemFont(ofSize: 20)
            content.secondaryText = itemIdentifier.talk
            content.secondaryTextProperties.font = .systemFont(ofSize: 12)
            content.image = itemIdentifier.image
            content.imageProperties.maximumSize = CGSize(width: 50, height: 50)
            
            // UICollectionViewListCell 콘텐츠 설정 부분
            cell.contentConfiguration = content
           
        }
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
        var snapshot = NSDiffableDataSourceSnapshot<Int, Friend>()
        snapshot.appendSections([0])
        snapshot.appendItems(talkList, toSection: 0)
           dataSource.apply(snapshot, animatingDifferences: false)
    }
}
