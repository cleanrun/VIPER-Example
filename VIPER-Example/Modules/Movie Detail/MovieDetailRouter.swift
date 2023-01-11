//
//  MovieDetailRouter.swift
//  VIPER-Example
//
//  Created by cleanmac on 11/01/23.
//

import UIKit

final class MovieDetailRouter: MovieDetailPresenterToRouterProtocol {
    static func createModule(movieId: Int) -> MovieDetailViewController {
        let view = MovieDetailViewController()
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(movieId: movieId,
                                             view: view,
                                             interactor: interactor,
                                             router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func popToMovieList(using navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
    
}
