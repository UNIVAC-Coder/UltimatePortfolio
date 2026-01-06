//
//  AwardsView.swift
//  UltimatePortfolio
//
//  Created by Thomas Cavalli on 1/5/26.
//

import SwiftUI

struct AwardsView: View {
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 100))]
    }
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(Award.allAwards) { award in
                    Button {
                        // no action
                    } label: {
                        Image(systemName: award.image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.secondary.opacity(0.5))
                    }
                }
            }
        }
        .navigationTitle("Awards")
    }
}
