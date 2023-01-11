//
//  MovieDetailViewController.swift
//  VIPER-Example
//
//  Created by cleanmac on 11/01/23.
//

import UIKit
import Combine

final class MovieDetailViewController: UIViewController {
    private var movieImdbIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    private var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()
    
    private var movieOverviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private var disposables = Set<AnyCancellable>()
    var presenter: MovieDetailViewToPresenterProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support Storyboard initializations")
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(movieImdbIdLabel)
        view.addSubview(movieTitleLabel)
        view.addSubview(movieOverviewLabel)
        
        NSLayoutConstraint.activate([
            movieImdbIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieImdbIdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieImdbIdLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieTitleLabel.topAnchor.constraint(equalTo: movieImdbIdLabel.bottomAnchor, constant: 6),
            
            movieOverviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieOverviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            movieOverviewLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 6),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        view.backgroundColor = .systemBackground
        presenter?.startFetchingMovieDetail()
    }
    
    private func setupUI(_ movie: MovieEntity) {
        movieImdbIdLabel.text = "IMDB ID: \(movie.imdbID ?? "")"
        movieTitleLabel.text = movie.title ?? ""
        movieOverviewLabel.text = movie.overview ?? ""
    }
}

extension MovieDetailViewController: MovieDetailPresenterToViewProtocol {
    func observeMovieDetail(subject: CurrentValueSubject<MovieEntity?, NSError>) {
        subject.sink(receiveCompletion: { _ in
            print("Error received")
        }, receiveValue: { [weak self] value in
            if let value {
                DispatchQueue.main.async {
                    self?.setupUI(value)
                }
            }
        }).store(in: &disposables)
    }
}
