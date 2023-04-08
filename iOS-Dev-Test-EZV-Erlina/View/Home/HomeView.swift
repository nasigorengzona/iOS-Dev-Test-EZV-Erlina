//
//  ContentView.swift
//  iOS-Dev-Test-EZV-Erlina
//
//  Created by erlina ng on 07/04/23.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @StateObject var homeVM : HomeViewModel = .init()

    var body: some View {
        NavigationView {
            List{
                ForEach(homeVM.allProducts, id: \.self) { product in
                    NavigationLink(destination: DetailView(product: product)) {
                        ListComponentView(product: product)
                    }
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
