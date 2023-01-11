//
//  MovieListCell.swift
//  VIPER-Example
//
//  Created by cleanmac on 11/01/23.
//

import UIKit

final class MovieListCell: UITableViewCell {
    static let REUSE_IDENTIFIER = String(describing: MovieListCell.self)
    
    private var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieReleaseDateLabel)
        
        NSLayoutConstraint.activate([
            movieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            movieReleaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            movieReleaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            movieReleaseDateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
            movieReleaseDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support Storyboard initializations")
    }
    
    func setupContents(_ movie: MovieEntity) {
        movieTitleLabel.text = movie.title ?? ""
        movieReleaseDateLabel.text = "Release Date: \(movie.releaseDate ?? "")"
    }
}
