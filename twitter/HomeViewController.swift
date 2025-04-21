//
//  Untitled.swift
//  twitter
//
//  Created by rom on 21/04/2025.
//

import UIKit
import Nuke
class HomeViewController:UIViewController {
    private let collectioniew: UICollectionView={
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        return collectionView
    }()
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // use Auto Layout
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectioniew)
        configureImage()
        Task {
            try await loadImage()
        }
    }
    
    private func loadImage() async throws {
        let imageTask = ImagePipeline.shared.imageTask(with: "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
        imageView.image = try await imageTask.image
    }
    
    private func configureImage(){
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.5), // makes it square
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}
