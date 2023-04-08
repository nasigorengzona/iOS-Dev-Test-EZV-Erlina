//
//  ListComponentView.swift
//  iOS-Dev-Test-EZV-Erlina
//
//  Created by erlina ng on 07/04/23.
//

import SwiftUI

struct ListComponentView : View {
    @StateObject var listComponentVM : ListComponentViewModel = .init()
    var product : Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail)) {
                image in image.image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.4, height: screenHeight * 0.2)
                    .cornerRadius(15)
            }
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .fontWeight(.bold)
                Text("USD \(String(product.price))")
                    .font(.caption)
                Text("Rating : \(String(product.rating)) / 5.0")
                    .font(.caption)
                
                if listComponentVM.checkFave(id: product.id) {
                    Image(systemName: "heart.fill")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
        }
        .padding(10)
        .frame(width: screenWidth * 0.75, height:  screenHeight * 0.2)
    }
}

//struct ListComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListComponentView(product: <#Product#>)
//    }
//}
