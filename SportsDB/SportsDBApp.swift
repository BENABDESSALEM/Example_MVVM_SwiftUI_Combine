//
//  SportsDBApp.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 6/2/2023.
//

import SwiftUI

@main
struct SportsDBApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(apiService: APIService()))
        }
    }
}
