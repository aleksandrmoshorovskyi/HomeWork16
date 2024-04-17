//
//  OnboardingModel.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import Foundation

protocol OnboardingModelDelegate: AnyObject {
    
    func dataDidLoad()
}

class OnboardingModel {
    
    weak var delegate: OnboardingModelDelegate?
 
    var dataLoader = DataLoader()
    
    var items: [FlowItems] = []
    
    func loadData() {
        items = dataLoader.getOnboardingFlowData()
        delegate?.dataDidLoad()
    }
}

/*
class MainPlaylistModel {

    weak var delegate: MainPlaylistModelDelegate?
    
    let dataLoader = DataLoaderService()
    
    var items: [Song] = []
    
    func loadData() {
        
        dataLoader.loadPlaylist { playlist in
            
            self.items = playlist?.songs ?? []
            self.delegate?.dataDidLoad()
        }
    }
}
*/
 
/*
 import Foundation

 protocol SampleModelDelegate: AnyObject {
     
     func dataDidLoad()
 }

 class SampleModel {
     
     weak var delegate: SampleModelDelegate?
     
     var someData: [String] = []
     
     func loadData() {
         self.someData = ["First", "Second", "Third", "Fourth", "Fifth", "Nasth", "Coffeth"]
         self.delegate?.dataDidLoad()
     }
 }
 */

/*
 import Foundation

 class MyModel {
     var name: String = ""
     var lastName: String = ""
     var age: Int = 0
     var delegate: MyModelDelegate? = nil
     
     func LoadData() {
         
         delegate?.DataDidLoad()
     }
 }

 protocol MyModelDelegate: AnyObject {
     
     func DataDidLoad()
 }
 */
