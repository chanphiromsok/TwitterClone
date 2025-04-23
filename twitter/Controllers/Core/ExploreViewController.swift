// ExploreViewController.swift
// twitter
//
// Created by rom on 23/04/2025.
//

import Nuke
import UIKit

class ExploreViewController: UIViewController {
    enum Section: CaseIterable {
        case main
        case video
    }

    private var collectionView: UICollectionView! = nil
    private var dataSource:
        UICollectionViewDiffableDataSource<Section, ExploreItem>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }
}

// MARK: - ConfigureCollectionView
extension ExploreViewController {
    private func configureHierarchy() {
        collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            ExploreCollectionViewCell.self,
            forCellWithReuseIdentifier: ExploreCollectionViewCell.identifier)
        collectionView.delegate = self  // Keep delegate for handling selection

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
        ])
    }

    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            let section = Section.allCases[sectionIndex]
            switch section {
            case .main:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.25),
                    heightDimension: .fractionalWidth(0.25))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalWidth(0.25))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize, subitems: [item])

                let sectionLayout = NSCollectionLayoutSection(group: group)
                return sectionLayout
            case .video:
                return nil;
            }
        }
        return layout
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, ExploreItem>(
            collectionView: collectionView
        ) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            // Removed the unused [weak self] capture
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ExploreCollectionViewCell.identifier,
                    for: indexPath
                ) as? ExploreCollectionViewCell
            else {
                fatalError(
                    "Failed to dequeue ExploreCollectionViewCell in ExploreViewController"
                )
            }
            cell.configure(with: item.imageUrl,indexPath.item)
            return cell
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, ExploreItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(mockExploreItems)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

}

// MARK: - UICollectionViewDelegate
extension ExploreViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath
    ) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // Handle item selection here
    }
}
struct ExploreItem: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let imageUrl: String

    init(title: String, imageName: String) {
        self.title = title
//        self.imageUrl = "http://192.168.31.169:8000/\(imageName)"
        self.imageUrl = "http://192.168.31.169:8000/resized_images/\(imageName)"

    }
}

let mockExploreItems: [ExploreItem] = [
    ExploreItem(title: "Explore 1", imageName: "ASC1.jpg"),
    ExploreItem(title: "Explore 2", imageName: "ASC2.jpg"),
    ExploreItem(title: "Explore 3", imageName: "ASC3.jpg"),
    ExploreItem(title: "Explore 4", imageName: "ASC4.jpg"),
    ExploreItem(title: "Explore 5", imageName: "ASC5.jpg"),
    ExploreItem(title: "Explore 6", imageName: "ASC6.jpg"),
    ExploreItem(title: "Explore 7", imageName: "ASC7.jpg"),
    ExploreItem(title: "Explore 8", imageName: "ASC8.jpg"),
    ExploreItem(title: "Explore 9", imageName: "ASC9.jpg"),
    ExploreItem(title: "Explore 10", imageName: "ASC10.jpg"),
    ExploreItem(title: "Explore 11", imageName: "ASC11.jpg"),
    ExploreItem(title: "Explore 12", imageName: "ASC12.jpg"),
    ExploreItem(title: "Explore 13", imageName: "ASC13.jpg"),
    ExploreItem(title: "Explore 14", imageName: "ASC14.jpg"),
    ExploreItem(title: "Explore 15", imageName: "ASC15.jpg"),
    ExploreItem(title: "Explore 16", imageName: "ASC16.jpg"),
    ExploreItem(title: "Explore 17", imageName: "ASC17.jpg"),
    ExploreItem(title: "Explore 18", imageName: "ASC18.jpg"),
    ExploreItem(title: "Explore 19", imageName: "ASC19.jpg"),
    ExploreItem(title: "Explore 20", imageName: "ASC20.jpg"),
    ExploreItem(title: "Explore 21", imageName: "ASC21.jpg"),
    ExploreItem(title: "Explore 22", imageName: "ASC22.jpg"),
    ExploreItem(title: "Explore 23", imageName: "ASC23.jpg"),
    ExploreItem(title: "Explore 24", imageName: "ASC24.jpg"),
    ExploreItem(title: "Explore 25", imageName: "ASC25.jpg"),
    ExploreItem(title: "Explore 1", imageName: "ASC1.jpg"),
    ExploreItem(title: "Explore 2", imageName: "ASC2.jpg"),
    ExploreItem(title: "Explore 3", imageName: "ASC3.jpg"),
    ExploreItem(title: "Explore 4", imageName: "ASC4.jpg"),
    ExploreItem(title: "Explore 5", imageName: "ASC5.jpg"),
    ExploreItem(title: "Explore 6", imageName: "ASC6.jpg"),
    ExploreItem(title: "Explore 7", imageName: "ASC7.jpg"),
    ExploreItem(title: "Explore 8", imageName: "ASC8.jpg"),
    ExploreItem(title: "Explore 9", imageName: "ASC9.jpg"),
    ExploreItem(title: "Explore 10", imageName: "ASC10.jpg"),
    ExploreItem(title: "Explore 11", imageName: "ASC11.jpg"),
    ExploreItem(title: "Explore 12", imageName: "ASC12.jpg"),
    ExploreItem(title: "Explore 13", imageName: "ASC13.jpg"),
    ExploreItem(title: "Explore 14", imageName: "ASC14.jpg"),
    ExploreItem(title: "Explore 15", imageName: "ASC15.jpg"),
    ExploreItem(title: "Explore 16", imageName: "ASC16.jpg"),
    ExploreItem(title: "Explore 17", imageName: "ASC17.jpg"),
    ExploreItem(title: "Explore 18", imageName: "ASC18.jpg"),
    ExploreItem(title: "Explore 19", imageName: "ASC19.jpg"),
    ExploreItem(title: "Explore 20", imageName: "ASC20.jpg"),
    ExploreItem(title: "Explore 21", imageName: "ASC21.jpg"),
    ExploreItem(title: "Explore 22", imageName: "ASC22.jpg"),
    ExploreItem(title: "Explore 23", imageName: "ASC23.jpg"),
    ExploreItem(title: "Explore 24", imageName: "ASC24.jpg"),
    ExploreItem(title: "Explore 25", imageName: "ASC25.jpg"),
    ExploreItem(title: "Explore 1", imageName: "ASC1.jpg"),
    ExploreItem(title: "Explore 2", imageName: "ASC2.jpg"),
    ExploreItem(title: "Explore 3", imageName: "ASC3.jpg"),
    ExploreItem(title: "Explore 4", imageName: "ASC4.jpg"),
    ExploreItem(title: "Explore 5", imageName: "ASC5.jpg"),
    ExploreItem(title: "Explore 6", imageName: "ASC6.jpg"),
    ExploreItem(title: "Explore 7", imageName: "ASC7.jpg"),
    ExploreItem(title: "Explore 8", imageName: "ASC8.jpg"),
    ExploreItem(title: "Explore 9", imageName: "ASC9.jpg"),
    ExploreItem(title: "Explore 10", imageName: "ASC10.jpg"),
    ExploreItem(title: "Explore 11", imageName: "ASC11.jpg"),
    ExploreItem(title: "Explore 12", imageName: "ASC12.jpg"),
    ExploreItem(title: "Explore 13", imageName: "ASC13.jpg"),
    ExploreItem(title: "Explore 14", imageName: "ASC14.jpg"),
    ExploreItem(title: "Explore 15", imageName: "ASC15.jpg"),
    ExploreItem(title: "Explore 16", imageName: "ASC16.jpg"),
    ExploreItem(title: "Explore 17", imageName: "ASC17.jpg"),
    ExploreItem(title: "Explore 18", imageName: "ASC18.jpg"),
    ExploreItem(title: "Explore 19", imageName: "ASC19.jpg"),
    ExploreItem(title: "Explore 20", imageName: "ASC20.jpg"),
    ExploreItem(title: "Explore 21", imageName: "ASC21.jpg"),
    ExploreItem(title: "Explore 22", imageName: "ASC22.jpg"),
    ExploreItem(title: "Explore 23", imageName: "ASC23.jpg"),
    ExploreItem(title: "Explore 24", imageName: "ASC24.jpg"),
    ExploreItem(title: "Explore 25", imageName: "ASC25.jpg"),
    ExploreItem(title: "Explore 1", imageName: "ASC1.jpg"),
    ExploreItem(title: "Explore 2", imageName: "ASC2.jpg"),
    ExploreItem(title: "Explore 3", imageName: "ASC3.jpg"),
    ExploreItem(title: "Explore 4", imageName: "ASC4.jpg"),
    ExploreItem(title: "Explore 5", imageName: "ASC5.jpg"),
    ExploreItem(title: "Explore 6", imageName: "ASC6.jpg"),
    ExploreItem(title: "Explore 7", imageName: "ASC7.jpg"),
    ExploreItem(title: "Explore 8", imageName: "ASC8.jpg"),
    ExploreItem(title: "Explore 9", imageName: "ASC9.jpg"),
    ExploreItem(title: "Explore 10", imageName: "ASC10.jpg"),
    ExploreItem(title: "Explore 11", imageName: "ASC11.jpg"),
    ExploreItem(title: "Explore 12", imageName: "ASC12.jpg"),
    ExploreItem(title: "Explore 13", imageName: "ASC13.jpg"),
    ExploreItem(title: "Explore 14", imageName: "ASC14.jpg"),
    ExploreItem(title: "Explore 15", imageName: "ASC15.jpg"),
    ExploreItem(title: "Explore 16", imageName: "ASC16.jpg"),
    ExploreItem(title: "Explore 17", imageName: "ASC17.jpg"),
    ExploreItem(title: "Explore 18", imageName: "ASC18.jpg"),
    ExploreItem(title: "Explore 19", imageName: "ASC19.jpg"),
    ExploreItem(title: "Explore 20", imageName: "ASC20.jpg"),
    ExploreItem(title: "Explore 21", imageName: "ASC21.jpg"),
    ExploreItem(title: "Explore 22", imageName: "ASC22.jpg"),
    ExploreItem(title: "Explore 23", imageName: "ASC23.jpg"),
    ExploreItem(title: "Explore 24", imageName: "ASC24.jpg"),
    ExploreItem(title: "Explore 25", imageName: "ASC25.jpg"),
    ExploreItem(title: "Explore 1", imageName: "ASC1.jpg"),
    ExploreItem(title: "Explore 2", imageName: "ASC2.jpg"),
    ExploreItem(title: "Explore 3", imageName: "ASC3.jpg"),
    ExploreItem(title: "Explore 4", imageName: "ASC4.jpg"),
    ExploreItem(title: "Explore 5", imageName: "ASC5.jpg"),
    ExploreItem(title: "Explore 6", imageName: "ASC6.jpg"),
    ExploreItem(title: "Explore 7", imageName: "ASC7.jpg"),
    ExploreItem(title: "Explore 8", imageName: "ASC8.jpg"),
    ExploreItem(title: "Explore 9", imageName: "ASC9.jpg"),
    ExploreItem(title: "Explore 10", imageName: "ASC10.jpg"),
    ExploreItem(title: "Explore 11", imageName: "ASC11.jpg"),
    ExploreItem(title: "Explore 12", imageName: "ASC12.jpg"),
    ExploreItem(title: "Explore 13", imageName: "ASC13.jpg"),
    ExploreItem(title: "Explore 14", imageName: "ASC14.jpg"),
    ExploreItem(title: "Explore 15", imageName: "ASC15.jpg"),
    ExploreItem(title: "Explore 16", imageName: "ASC16.jpg"),
    ExploreItem(title: "Explore 17", imageName: "ASC17.jpg"),
    ExploreItem(title: "Explore 18", imageName: "ASC18.jpg"),
    ExploreItem(title: "Explore 19", imageName: "ASC19.jpg"),
    ExploreItem(title: "Explore 20", imageName: "ASC20.jpg"),
    ExploreItem(title: "Explore 21", imageName: "ASC21.jpg"),
    ExploreItem(title: "Explore 22", imageName: "ASC22.jpg"),
    ExploreItem(title: "Explore 23", imageName: "ASC23.jpg"),
    ExploreItem(title: "Explore 24", imageName: "ASC24.jpg"),
    ExploreItem(title: "Explore 25", imageName: "ASC25.jpg"),
]


//extension ExploreViewController: UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0.0
//    }
//}
