//
//  MovieListInteractor.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import Foundation

final class MovieListInteractor: MovieListPresenterToInteractorProtocol {
    @Dependency(\.webservice) var webservice: Webservice
    weak var presenter: MovieListInteractorToPresenterProtocol?
    
    func fetchMovieList() {
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=e9325a84053f572e130d8028237ab315&language=en-US&page=1"
        Task {
            do {
                let response = try await webservice.request(endpoint: urlString, type: MovieListEntity.self)
                presenter?.noticeMovieListFetched(response)
            } catch {
                presenter?.noticeError()
            }
        }
    }
    
}
