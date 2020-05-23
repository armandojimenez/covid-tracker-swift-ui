//
//  Model.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import Foundation

struct TotalData {
    let newConfirmed : Int
    let totalConfirmed : Int
    let totalDeaths : Int
    let newDeaths : Int
    let lastUpdate : Date
    let newRecovered : Int
    let totalRecovered : Int

    
    var fatalityRate : Double {
        return (100.00 * Double(totalDeaths)) / Double(totalConfirmed)
    }
    
    var recoverRate : Double {
        return (100.00 * Double(totalRecovered)) / Double(totalConfirmed)
    }
}

struct CountryData {
    
    let country: String
    let newConfirmed : Int
    let totalConfirmed : Int

    let totalDeaths : Int
    let newDeaths : Int
    let date : String
    let newRecovered : Int
    let totalRecovered : Int

       
     var fatalityRate : Double {
         return (100.00 * Double(totalDeaths)) / Double(totalConfirmed)
     }
     
     var recoverRate : Double {
         return (100.00 * Double(totalRecovered)) / Double(totalConfirmed)
     }
    
}

let testTotalData = TotalData(newConfirmed: 200, totalConfirmed: 98, totalDeaths: 78, newDeaths: 56, lastUpdate: Date(), newRecovered: 67, totalRecovered: 98)

let testCountryData = CountryData(country: "Puerto Rico", newConfirmed: 42, totalConfirmed: 54, totalDeaths: 56, newDeaths: 86, date: "2020-05-03T22:04:53+02:00", newRecovered: 65, totalRecovered: 87)
