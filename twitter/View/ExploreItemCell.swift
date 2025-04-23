// ExploreCollectionViewCell.swift

import Nuke
import NukeUI
import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    static let identifier = "ExploreItemCollectionViewCell"
    private var lazyImageView: LazyImageView! = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("ExploreCollectionViewCell not implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        lazyImageView.cancel()

    }
}

// MARK: - Configure Image
extension ExploreCollectionViewCell {

    public func configure(with imageUrl: String, _ idx: Int) {
        guard let url = URL(string: imageUrl) else {
            print("Invalid URL: \(imageUrl)")
            return
        }
        //        lazyImageView.placeholderView = UIActivityIndicatorView()
        lazyImageView.url = url
        lazyImageView.priority = .normal
        //        lazyImageView.onCompletion = { _ in print("Request completed \(idx)") }

    }
}

// MARK: - Setup Layout
extension ExploreCollectionViewCell {
    private func configureHierarchy() {
        lazyImageView = LazyImageView()
        contentView.addSubview(lazyImageView)
        lazyImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            lazyImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            lazyImageView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor),
            lazyImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            lazyImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
        ])

    }
}
