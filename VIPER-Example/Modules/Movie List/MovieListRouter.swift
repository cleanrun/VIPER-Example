//
//  MovieListRouter.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import UIKit

final class MovieListRouter: MovieListPresenterToRouterProtocol {
    static func createModule() -> MovieListViewController {
        let view = MovieListViewController()
        let interactor = MovieListInteractor()
        let router = MovieListRouter()
        let presenter = MovieListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToMovieDetail(using navigationController: UINavigationController, movieId: Int) {
        let vc = MovieDetailRouter.createModule(movieId: movieId)
        navigationController.pushViewController(vc, animated: true)
    }
}
