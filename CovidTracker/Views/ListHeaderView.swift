//
//  ListHeaderView.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        HStack {
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 110, alignment: Alignment.leading)
                .padding(.leading, 15)
            
            Spacer()
            
            Text("Conf.")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()

            
            Text("Death")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()

            
            Text("Recover")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.trailing, 15)
            
            
        }.background(Color.gray)
        
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
