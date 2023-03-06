//
//  TeamView.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 9/2/2023.
//

import SwiftUI

struct TeamView: View {
    @ObservedObject var viewModel: HomeViewModel
    var style: GridLayoutStyle

    var items: [GridItem] {
        switch style {
        case .vertical:
            return Array(repeating: .init(.adaptive(minimum: 130)), count: 2)
        case .horizontal:
            return Array(repeating: .init(.fixed(130)), count: 2)
        }
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch style {
            case .horizontal:
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: items) {
                        TeamListView(teams: viewModel.teams)
                    }
                    .padding(.vertical)
                }
            case .vertical:
                LazyVGrid(columns: items, spacing: 10) {
                    TeamListView(teams: viewModel.teams)
                }
                .padding(.horizontal)
            }
        }
    }
}


