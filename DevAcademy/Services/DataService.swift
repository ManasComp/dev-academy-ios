//
//  DataService.swift
//  DevAcademy
//
//  Created by Ondřej Man on 08.08.2023.
//

import Foundation

final class DataService {

    var data: Result<Places, Error>? = nil

    static let shared = DataService()
    private init() {}

    func fetchData(_ handler: @escaping (Result<Places, Error>) -> Void) {
        if let data {
            handler(data)
            return
        }

        Timer.scheduledTimer(
            withTimeInterval: 1.0,
            repeats: false,
            block: { [weak self] _ in
                let newData = Places.mock

                self?.data = .success(newData)
                handler(.success(newData))
            }
        )
    }
}

