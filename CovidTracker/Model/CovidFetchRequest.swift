//
//  CovidFetchRequest.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject {
    
    @Published var allCountries: [CountryData] = []
    @Published var totalData: TotalData = testTotalData
    
    
    init() {
        getSummary()
    }
    
    func getSummary() {
        debugPrint("Fetching Covid Info")
        
        AF.request( "https://api.covid19api.com/summary" ).responseJSON { response in
            
            debugPrint(response)
            
            let result = response.data
            
            if result != nil {
                
                let json = JSON(result!)
                
                
                let newConfirmed = json["Global"]["NewConfirmed"].intValue
                let totalConfirmed = json["Global"]["TotalConfirmed"].intValue
                let newDeaths = json["Global"]["NewDeaths"].intValue
                let totalDeaths = json["Global"]["TotalDeaths"].intValue
                let newRecovered = json["Global"]["NewRecovered"].intValue
                let totalRecovered = json["Global"]["TotalRecovered"].intValue

                self.totalData = TotalData(newConfirmed: newConfirmed, totalConfirmed: totalConfirmed, totalDeaths: totalDeaths, newDeaths: newDeaths, lastUpdate: Date(), newRecovered: newRecovered, totalRecovered: totalRecovered)
                
                var allCount: [CountryData] = []
                
                
                
                let  dataDictionary = json["Countries"].rawValue as! [Dictionary<String, AnyObject>]
                
                for countryData in dataDictionary {
                    let country = countryData["Country"] as? String ?? "Error"
                    
                    let totalRecovered = countryData["TotalRecovered"] as? Int ?? 0
                    
                    
                    let totalDeaths = countryData["TotalDeaths"] as? Int ?? 0
                    
                    let newConfirmed = countryData["NewConfirmed"] as? Int ?? 0
                    let newDeaths = countryData["NewDeaths"] as? Int ?? 0
                    let newRecovered = countryData["NewRecovered"] as? Int ?? 0
                    let totalConfirmed = countryData["TotalConfirmed"] as? Int ?? 0
                    
                    let countryObject = CountryData(country: country, newConfirmed: newConfirmed, totalConfirmed: totalConfirmed, totalDeaths: totalDeaths, newDeaths: newDeaths, date: "2020-05-03T21:18:24Z", newRecovered: newRecovered, totalRecovered: totalRecovered)
                    
                    allCount.append(countryObject)
                    
                }

                self.allCountries =  allCount.sorted(by: { $0.totalConfirmed > $1.totalConfirmed })
                
                
                
            } else {
                self.totalData = testTotalData
            }
        }
        
    }
    
}



