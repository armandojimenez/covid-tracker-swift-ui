//
//  SearchView.swift
//  CovidTracker
//
//  Created by Armando Jimenez on 5/3/20.
//  Copyright © 2020 Armando Jimenez. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    
    var body: some View {
        HStack {
            TextField("Country...", text: $searchText)
            .padding()
        }
    .frame(height: 50)
    .background(Color("cardBackgroundGray"))
    }
}

