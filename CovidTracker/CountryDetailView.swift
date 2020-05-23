//
//  CountryDetailView.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    var countryData: CountryData
    
    var body: some View {
        VStack {
            VStack {
                    CountryDetailRow(number: countryData.totalConfirmed.formatNumer(), name: "Confirmed")
                        .padding(.top)
                    
                    CountryDetailRow(number: "+ \(countryData.newConfirmed.formatNumer())", name: "New Cases", color: Color.yellow)
                    
                    CountryDetailRow(number: countryData.newConfirmed.formatNumer(), name: "Deaths", color: Color.red)
                    
                     CountryDetailRow(number: String(format: "%.2f", countryData.fatalityRate), name: "Deaths %", color: Color.red)
                    
                     CountryDetailRow(number: countryData.totalRecovered.formatNumer(), name: "Recovered", color: Color.green)
                    
                     CountryDetailRow(number: String(format: "%.2f", countryData.recoverRate), name: "Recovered %", color: Color.green)
                }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()

        }
        .padding(.top, 50)
        .navigationBarTitle(countryData.country)
        
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}
