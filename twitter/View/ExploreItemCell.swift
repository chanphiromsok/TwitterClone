// ExploreCollectionViewCell.swift

import Nuke
import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    static let identifier = "ExploreItemCollectionViewCell"
    private var imageView: UIImageView! = nil
    private var imageURL: URL? = nil
    private var loadingTask: ImageTask? = nil  // Moved this property here

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("ExploreCollectionViewCell not implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        loadingTask?.cancel()
        loadingTask = nil
        imageView.image = nil

    }
}

// MARK: - Configure Image
extension ExploreCollectionViewCell {

    public func configure(with imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            print("Invalid URL: \(imageUrl)")
            return
        }
        // Cancel any previous loading task
        loadingTask?.cancel()
        // Create the request
        let request = ImageRequest(
            url: url,
            priority: .normal
        )

        // Load the image using completion handler
        loadingTask = ImagePipeline.shared.loadImage(
            with: request,
            completion: { [weak self] result in
                guard let self = self else { return }

                switch result {
                case .success(let response):
                    self.imageView.image = response.image

                case .failure(let error):
                    print("Failed to load image: \(error)")

                }
            }
        )

    }
}

// MARK: - Setup Layout
extension ExploreCollectionViewCell {
    private func configureHierarchy() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
        ])
    }
}
