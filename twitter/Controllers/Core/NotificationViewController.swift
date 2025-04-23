//
//  NotificationViewController.swift
//  twitter
//
//  Created by rom on 22/04/2025.
//

import UIKit
import Nuke

class NotificationViewController: UIViewController {
    enum Section {
        case main
    }
    var dataSource: UICollectionViewDiffableDataSource<Section,Int>! = nil
    var collectionView: UICollectionView! = nil
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // use Auto Layout
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeirachy()
        configureDataSource()
    }
}

extension NotificationViewController{
   
    private func createLayout()-> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

extension NotificationViewController:UICollectionViewDelegate {
    
    
    func configureHeirachy(){
        collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: createLayout())
        collectionView.autoresizingMask=[.flexibleWidth,.flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate=self
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { [weak self] (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item)"
            content.secondaryText = "Optional subtitle text"
            
            // Start with a placeholder
            content.image = UIImage(systemName: "photo")
            content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
            content.imageProperties.cornerRadius = 4
            content.imageProperties.tintColor = .systemBlue
            
            cell.contentConfiguration = content
            
            // Create the image URL (ideally based on your item)
            let imageUrlString = "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
            guard let imageUrl = URL(string: imageUrlString) else { return }
            
            // For Nuke 10+
            Task {
                do {
                    let request = ImageRequest(url: imageUrl)
                    let imageContainer = try await ImagePipeline.shared.image(for: request)
                    
                    await MainActor.run {
                        // Make sure cell still represents the same item
                        if let currentIndexPath = self?.collectionView.indexPath(for: cell),
                           let currentItem = self?.dataSource.itemIdentifier(for: currentIndexPath),
                           currentItem == item {
                            var updatedContent = cell.contentConfiguration as? UIListContentConfiguration ?? cell.defaultContentConfiguration()
                            updatedContent.image = imageContainer
                            cell.contentConfiguration = updatedContent
                        }
                    }
                } catch {
                    print("Failed to load image: \(error)")
                }
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<94))
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
