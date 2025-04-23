//
//  Untitled.swift
//  twitter
//
//  Created by rom on 21/04/2025.
//

import UIKit
import Nuke

private enum Section: Hashable {
    case main
}

private struct ExploreItem : Hashable {
    private let identifier = UUID()
    let title: String;
    init(title: String) {
        self.title = title
    }
    
    static let all = [
        ExploreItem(title: "heelo"),
        ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"), ExploreItem(title: "heelo"),
    ]

}
class HomeViewController:UIViewController, UICollectionViewDelegate {
    
    
    private var collectionView: UICollectionView! = nil
    private var dataSource:UICollectionViewDiffableDataSource<Int,ExploreItem>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Explore"
        configureHierarchy()
        configureDataSource()
    }

}

extension HomeViewController {
    private func configureHierarchy(){
        collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: createLayout())
        collectionView.autoresizingMask=[.flexibleWidth,.flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
    private func configureDataSource(){
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell,ExploreItem> {(cell,indexPath,item) in
            var contentConfiguration = cell.defaultContentConfiguration()
            // Update text
            contentConfiguration.text = item.title
            // Assing to content
            cell.contentConfiguration = contentConfiguration
        }
        dataSource = UICollectionViewDiffableDataSource<Int, ExploreItem>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: ExploreItem) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Int, ExploreItem>()
        snapshot.appendSections([1])
        snapshot.appendItems(ExploreItem.all)
        dataSource.apply(snapshot, animatingDifferences: true)
        
    }
}
// MARK: Config UICollectionView
extension HomeViewController{
    private func createLayout() -> UICollectionViewLayout{
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.showsSeparators = false
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}


extension HomeViewController{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
