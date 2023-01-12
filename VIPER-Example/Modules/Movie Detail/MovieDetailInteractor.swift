//
//  MovieDetailInteractor.swift
//  VIPER-Example
//
//  Created by cleanmac on 11/01/23.
//

import Foundation

final class MovieDetailInteractor: MovieDetailPresenterToInteractorProtocol {
    @Dependency(\.webservice) var webservice: Webservice
    weak var presenter: MovieDetailInteractorToPresenterProtocol?
    
    func fetchMovieDetail(id: Int) {
        let urlString = "https://api.themoviedb.org/3/movie/\(id)?api_key=e9325a84053f572e130d8028237ab315&language=en-US"
        Task {
            do {
                let response = try await webservice.request(endpoint: urlString, type: MovieEntity.self)
                presenter?.noticeMovieDetailFetched(response)
            } catch {
                presenter?.noticeError()
            }
        }
    }
    
}
