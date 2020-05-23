//
//  TotalDataView.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData: TotalData
    
    var body: some View {
        VStack {
            
            HStack {
                TotalDataCard(number: totalData.totalConfirmed.formatNumer(), name: "Confirmed"
                )
                TotalDataCard(number: "+ \(totalData.newConfirmed.formatNumer())", name: "New Cases", color: .yellow
                )
                TotalDataCard(number: totalData.totalDeaths.formatNumer(), name: "Deaths", color: .red
                )
            }
            HStack {
                TotalDataCard(number: String(format: "%.2f", totalData.fatalityRate), name: "Death %", color: .red
                )
                TotalDataCard(number: totalData.totalRecovered.formatNumer(), name: "Recovered", color: .green
                )
                TotalDataCard(number:  String(format: "%.2f", totalData.recoverRate), name: "Recovery %", color: .green
                )
            }
        }
        .frame( height: 170)
        .padding(10)
        //End of VSstack
        
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: testTotalData)
    }
}
