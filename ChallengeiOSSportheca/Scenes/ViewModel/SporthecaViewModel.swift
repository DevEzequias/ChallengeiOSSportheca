//
//  SporthecaViewModel.swift
//  ChallengeiOSSportheca
//
//  Created by Ezequias Santos on 01/12/22.
//

import Foundation
import UIKit

// MARK: - SporthecaModelProtocol
protocol SporthecaModelProtocol {
    var sporthecaObject: Observable<Object?> { get }
}

final class SporthecaViewModel: SporthecaModelProtocol {
    
    // MARK: - Properties
    var sporthecaObject: Observable<Object?>
    
    // MARK: - Initialization
    init () {
        self.sporthecaObject = Observable(nil)
        self.getSportheca()
    }
    
    // MARK: Helpers
    func getSportheca() {
        Service.shared.fetchSportheca { response in
            if let response = response {
                if response.status == 200 {
                    for object in response.object ?? [] {
                        self.sporthecaObject.value = object
                    }
                }
            }
        }
    }
}
