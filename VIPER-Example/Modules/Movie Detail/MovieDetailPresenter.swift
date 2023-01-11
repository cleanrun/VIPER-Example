//
//  MovieDetailPresenter.swift
//  VIPER-Example
//
//  Created by cleanmac on 11/01/23.
//

import UIKit
import Combine

final class MovieDetailPresenter: MovieDetailViewToPresenterProtocol {
    let movieId: Int
    
    weak var view: MovieDetailPresenterToViewProtocol?
    var interactor: MovieDetailPresenterToInteractorProtocol?
    var router: MovieDetailPresenterToRouterProtocol?
    var movieDetail: CurrentValueSubject<MovieEntity?, NSError>! = CurrentValueSubject(nil)
    
    init(movieId: Int,
         view: MovieDetailPresenterToViewProtocol,
         interactor: MovieDetailPresenterToInteractorProtocol,
         router: MovieDetailPresenterToRouterProtocol) {
        self.movieId = movieId
        self.view = view
        self.interactor = interactor
        self.router = router
        view.observeMovieDetail(subject: movieDetail)
    }
    
    func startFetchingMovieDetail() {
        interactor?.fetchMovieDetail(id: movieId)
    }
    
    func backToMovieList(navigationController: UINavigationController) {
        router?.popToMovieList(using: navigationController)
    }
}

extension MovieDetailPresenter: MovieDetailInteractorToPresenterProtocol {
    func noticeMovieDetailFetched(_ movie: MovieEntity) {
        movieDetail.send(movie)
    }
    
    func noticeError() {
        movieDetail.send(completion: .failure(NSError(domain: "Movie not found", code: 400)))
    }
}
