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
        
        if let kind = Kind.init(rawValue:  rawValue) {
            self = PossibleKind.kind(kind)
        }
        else {
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
    let ogcFid : Int
    let obrId1 : URL
    let druh : PossibleKind
    let nazev : String
}

struct Point {
    let latitude : Float
    let longitude : Float
}

struct Feature : Equatable{
    static func == (lhs: Feature, rhs: Feature) -> Bool {
        lhs.properties.ogcFid == rhs.properties.ogcFid
    }
    
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
        if let data = data {
            action(data)
        }
        else {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self]_ in
                let result = Result<Features, Error>.success(DataService.mockData)
                
                self?.data = result
                action(result)
            }
        }
    }
}


extension DataService {
    private static let mockData = Features.mock;
}

extension Features {
    static let mock: Features = Features(
        features: [
            Feature(
                geometry: Point(latitude: 49.1913, longitude: 16.6115),
                properties: Properties(
                    ogcFid: 1,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.divadlo),
                    nazev: "Národní divadlo Brno"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2006, longitude: 16.6097),
                properties: Properties(
                    ogcFid: 2,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Kino Art Brno"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2019, longitude: 16.6151),
                properties: Properties(
                    ogcFid: 3,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.muzeum),
                    nazev: "Moravské zemské muzeum"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2079, longitude: 16.5938),
                properties: Properties(
                    ogcFid: 4,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kulturniCentrum),
                    nazev: "BOUFOU Prostějovská Brno"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2072, longitude: 16.6061),
                properties: Properties(
                    ogcFid: 5,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.hudebniKlub),
                    nazev: "Kabinet múz"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1894, longitude: 165602),
                properties: Properties(
                    ogcFid: 6,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.knihovna),
                    nazev: "Moravská zemská knihovna"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1914, longitude: 16.6126),
                properties: Properties(
                    ogcFid: 7,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.koncertniHala),
                    nazev: "Janáčkovo divadlo"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2182, longitude: 16.5893),
                properties: Properties(
                    ogcFid: 8,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kulturniPamátka),
                    nazev: "Špilberk Brno"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1920, longitude: 16.6071),
                properties: Properties(
                    ogcFid: 9,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.letniKino),
                    nazev: "Letní kino Lužánky"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 10,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.podnikSLulturnimProgramem),
                    nazev: "Bar, který neexistuje"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 11,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Cinema City"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 12,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Univerzitní kino Scala"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 13,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.hub),
                    nazev: "Impact Hub"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 14,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kulturniPamátka),
                    nazev: "Villa Tugendhat"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 15,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.vystaviste),
                    nazev: "Brněnské výstaviště"
                )
            )
        ]
    )
}
