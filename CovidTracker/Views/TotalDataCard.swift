//
//  TotalDataCard.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number : String = "Error"
    var name: String = "Confirmed"
    var color: Color  = .primary
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                
                Text(self.name)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
            } //End of VSTack
                .frame(width: geometry.size.width, height: 80.0, alignment: .center)
                .background(Color("cardBackgroundGray"))
                .cornerRadius(8.0)
        } //End of Geo
        
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
