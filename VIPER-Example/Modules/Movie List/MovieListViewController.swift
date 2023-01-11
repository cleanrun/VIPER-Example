//
//  MovieListView.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import UIKit
import Combine

final class MovieListViewController: UIViewController {
    
    private typealias DataSource = UITableViewDiffableDataSource<Int, MovieEntity>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, MovieEntity>
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var dataSource: DataSource!
    private var disposables = Set<AnyCancellable>()
    var presenter: MovieListViewToPresenterProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support Storyboard initializations")
    }
    
    override func loadView() {
        super.loadView()
        
        tableView.delegate = self
        tableView.register(MovieListCell.self, forCellReuseIdentifier: MovieListCell.REUSE_IDENTIFIER)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.REUSE_IDENTIFIER) as! MovieListCell
            cell.setupContents(item)
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        view.backgroundColor = .systemBackground
        presenter?.startFetchMovieList()
    }
    
    private func setupSnapshot(_ list: [MovieEntity]) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension MovieListViewController: MovieListPresenterToViewProtocol {
    func observeMovieList(subject: CurrentValueSubject<MovieListEntity?, NSError>) {
        subject.sink(receiveCompletion: { _ in
            print("Error received")
        }, receiveValue: { [weak self] value in
            if let value, let results = value.results {
                self?.setupSnapshot(results)
            }
        }).store(in: &disposables)
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showMovieDetail(indexPathRow: indexPath.row, navigationController: navigationController!)
    }
}
