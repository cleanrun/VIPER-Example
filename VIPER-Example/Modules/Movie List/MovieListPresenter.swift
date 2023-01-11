//
//  MovieListPresenter.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import Foundation
import Combine
import UIKit

final class MovieListPresenter: MovieListViewToPresenterProtocol {
    weak var view: MovieListPresenterToViewProtocol?
    var interactor: MovieListPresenterToInteractorProtocol?
    var router: MovieListPresenterToRouterProtocol?
    var movieList: CurrentValueSubject<MovieListEntity?, NSError>! = CurrentValueSubject(nil)
    
    init(view: MovieListPresenterToViewProtocol?,
         interactor: MovieListPresenterToInteractorProtocol?,
         router: MovieListPresenterToRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.view?.observeMovieList(subject: movieList)
    }
    
    func startFetchMovieList() {
        interactor?.fetchMovieList()
    }
    
    func showMovieDetail(indexPathRow: Int, navigationController: UINavigationController) {
        if let results = movieList.value?.results, let movieId = results[indexPathRow].ID {
            router?.pushToMovieDetail(using: navigationController, movieId: movieId)
        }
    }
    
}

extension MovieListPresenter: MovieListInteractorToPresenterProtocol {
    func noticeMovieListFetched(_ movieList: MovieListEntity) {
        self.movieList.send(movieList)
    }
    
    func noticeError() {
        self.movieList.send(completion: .failure(NSError(domain: "Failed fetching movies", code: 400)))
    }
    
}
