//
//  CountryDataRowView.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    var body: some View {
        HStack {
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 110, alignment: Alignment.leading)
            
            
            Spacer()
            
            Text(countryData.totalConfirmed.formatNumer())
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            
            Text(countryData.totalDeaths.formatNumer())
                .frame(width: 50, height: 40, alignment: Alignment.center)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading, 5)
            
            Spacer()
            
            
            Text(countryData.totalRecovered.formatNumer())
                .frame(width: 55, height: 40, alignment: Alignment.center)
                .font(.subheadline)
                .foregroundColor(.green)
                .padding(.leading, 5)
            
            
        }
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
