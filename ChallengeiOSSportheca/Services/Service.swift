//
//  Service.swift
//  ChallengeiOSSportheca
//
//  Created by Ezequias Santos on 01/12/22.
//

import Foundation
import Alamofire

class Service {
    
    static let shared = Service()

    //MARK: - Get fetchSportheca
    
    func fetchSportheca(onComplete: @escaping (SporthecaResponse?) -> Void) {
        let url: String
        url = "http://sportsmatch.com.br/teste/teste.json"
        print("DEBUG: url: \(url)")

        AF.request(url, method: .get, encoding: URLEncoding.default).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsondata = try JSONDecoder().decode(SporthecaResponse?.self, from: data!)
                    onComplete(jsondata)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
