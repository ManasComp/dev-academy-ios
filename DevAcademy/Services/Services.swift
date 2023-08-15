//
//  Services.swift
//  DevAcademy
//
//  Created by Ondřej Man on 14.08.2023.
//

import Foundation

final class Services {
    let dataService: DataService
    
    init(
        dataService: DataService
    ) {
        self.dataService = dataService
    }
}

extension Services {
    convenience init() {
        let dataService = DataService.shared

        self.init(
            dataService: dataService
        )
    }
}

extension Services {
    static let mock = Services(
        dataService: DataService.shared
    )
}
