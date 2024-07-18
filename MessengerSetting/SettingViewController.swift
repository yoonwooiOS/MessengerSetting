//
//  SettingViewController.swift
//  MessengerSetting
//
//  Created by 김윤우 on 7/18/24.
//

import UIKit
import SnapKit

class SettingViewController: BasicViewController {
    
    lazy var collectionView = {
        let tableView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        tableView.backgroundColor = .white
        return tableView
        
    }()
    var dataSource: UICollectionViewDiffableDataSource<Section,  SfSymbols>!
    func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .black
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureDataSource()
    }
                  
    override func setUpHierarchy() {
        view.addSubview(collectionView)
    }

    override func setUpLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, SfSymbols>!
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.name
            content.textProperties.color = .systemGreen
            content.secondaryText = itemIdentifier.category
            content.image = itemIdentifier.image
            
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .white
            
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            
            return cell
            
        })
       
        var snapshot = NSDiffableDataSourceSnapshot<Section, SfSymbols>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(Section.total.list, toSection: .total)
        snapshot.appendItems(Section.personal.list, toSection:  .personal)
        snapshot.appendItems(Section.others.list, toSection:  .others)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
}
