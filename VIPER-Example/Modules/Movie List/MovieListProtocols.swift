//
//  MovieListProtocols.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import UIKit
import Combine

protocol MovieListViewToPresenterProtocol: AnyObject {
    var view: MovieListPresenterToViewProtocol? { get set }
    var interactor: MovieListPresenterToInteractorProtocol? { get set }
    var router: MovieListPresenterToRouterProtocol? { get set }
    var movieList: CurrentValueSubject<MovieListEntity?, NSError>! { get set }
    
    func startFetchMovieList()
    func showMovieDetail(indexPathRow: Int, navigationController: UINavigationController)
}

protocol MovieListPresenterToViewProtocol: AnyObject {
    func observeMovieList(subject: CurrentValueSubject<MovieListEntity?, NSError>)
}

protocol MovieListPresenterToRouterProtocol: AnyObject {
    static func createModule() -> MovieListViewController
    func pushToMovieDetail(using navigationController: UINavigationController, movieId: Int)
}

protocol MovieListPresenterToInteractorProtocol: AnyObject {
    var presenter: MovieListInteractorToPresenterProtocol? { get set }
    
    func fetchMovieList()
}

protocol MovieListInteractorToPresenterProtocol: AnyObject {
    func noticeMovieListFetched(_ movieList: MovieListEntity)
    func noticeError()
}
