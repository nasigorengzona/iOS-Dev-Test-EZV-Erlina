//
//  DetailView.swift
//  iOS-Dev-Test-EZV-Erlina
//
//  Created by erlina ng on 07/04/23.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @StateObject var detailVM : DetailViewModel = DetailViewModel()
    var product : Product

    var body: some View {
        
        VStack() {
            //Thumbnail
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.9)
                    .cornerRadius(10)
            }
            //Product Name
            Text(product.title)
                .font(.title)
                .fontWeight(.bold)
            
            //Price & Disc
            HStack {
                Text("USD \(String(product.price))")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text("Disc for \(String(product.discountPercentage))%")
                    .font(.body)
                    .foregroundColor(.red)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 5)
            
            //Rating
            Text("Rating : \(String(product.rating)) / 5.0")
                .font(.body)
                .padding(.bottom, 3)
            
            //Brand
            Text("\(product.brand)")
                .font(.body)
                .fontWeight(.semibold)
                .padding(.bottom, 15)
            
            //Product Desc
            Text(product.description)
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.01)
                .font(.caption)
                .padding(.horizontal, 10)
                .padding(.bottom, 35)
            
            Spacer()
            //Button add / remove favorite
            Button(detailVM.checkFave(id: product.id) ? "Remove from Favorites" : "Add to Favorites") {
                if detailVM.isFave {
                    detailVM.removeFromFave(id: product.id)
                    print("Removed")
                } else {
                    detailVM.addFave(id: product.id)
                    print("Added to Fave list")
                }
            }
            .frame(width: screenWidth * 0.7)
            .foregroundColor(.white)
            .tint(Color.blue)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .padding(.bottom)
            
        }
    }
}

