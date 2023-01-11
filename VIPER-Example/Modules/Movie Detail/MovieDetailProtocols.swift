//
//  MovieDetailProtocols.swift
//  VIPER-Example
//
//  Created by cleanmac on 11/01/23.
//

import UIKit
import Combine

protocol MovieDetailViewToPresenterProtocol: AnyObject {
    var view: MovieDetailPresenterToViewProtocol? { get set }
    var interactor: MovieDetailPresenterToInteractorProtocol? { get set }
    var router: MovieDetailPresenterToRouterProtocol? { get set }
    var movieDetail: CurrentValueSubject<MovieEntity?, NSError>! { get set }
    
    func startFetchingMovieDetail()
    func backToMovieList(navigationController: UINavigationController)
}

protocol MovieDetailPresenterToViewProtocol: AnyObject {
    func observeMovieDetail(subject: CurrentValueSubject<MovieEntity?, NSError>)
}

protocol MovieDetailPresenterToRouterProtocol: AnyObject {
    static func createModule(movieId: Int) -> MovieDetailViewController
    func popToMovieList(using navigationController: UINavigationController)
}

protocol MovieDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: MovieDetailInteractorToPresenterProtocol? { get set }
    
    func fetchMovieDetail(id: Int)
}

protocol MovieDetailInteractorToPresenterProtocol: AnyObject {
    func noticeMovieDetailFetched(_ movie: MovieEntity)
    func noticeError()
}
