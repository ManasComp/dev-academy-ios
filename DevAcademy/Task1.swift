//
//  Task1.swift
//  DevAcademy
//
//  Created by Ondřej Man on 18.07.2023.
//

import Foundation

enum Kind: String {
    case divadlo = "Divadlo"
    case galerie = "Galerie"
    case hub = "Hub"
    case hudebniKlub = "Hudebni klub"
    case kino = "Kino"
    case knihovna = "Knihovna"
    case koncertniHala = "Koncertní hala"
    case kulturniCentrum = "Kulturní centrum"
    case kulturniPamátka = "Kulturní památka"
    case letniKino = "Letní kino"
    case muzeum = "Muzeum"
    case podnikSLulturnimProgramem = "Podnik s kulturním programem"
    case vystaviste = "Výstaviště"
    case ostatni = "Ostatní"
}

enum PossibleKind : RawRepresentable {
    
    typealias RawValue = String
    
    init?(rawValue : String) {
        
        if let kind = Kind.init(rawValue:  rawValue)
        {
            self = PossibleKind.kind(kind)
        }
        else
        {
            self = .unknown(rawValue)
        }
    }
    
    case kind(Kind)
    case unknown(String)
    
    var rawValue : String {
        switch self {
            case .kind(let neco):
                return neco.rawValue
            case .unknown(let string):
                return string
        }
    }
}

struct Properties {
    let ogcFid : NSNumber
    let obrId1 : URL
    let druh : PossibleKind
    let název : String
}

struct Point {
    let latitude : Float
    let longitude : Float
}

struct Feature {
    let geometry : Point
    let properties : Properties
}

struct Features {
    let features : [Feature]
}

class DataService {
    
    private init()
    {
    }
    
    static let shared = DataService.init()
    
    var data : Result<Features, Error>?

    func fetchdata(_ action: @escaping(Result<Features, Error>) -> Void) {
        if let data = data
        {
            action(data)
        }
        else
        {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self]_ in
                let result = Result<Features, Error>.success(DataService.mockData)
                
                self?.data = result
                action(result)
            }
        }
    }
}


extension DataService {
     private static let mockData : Features = Features(features: [])
}
