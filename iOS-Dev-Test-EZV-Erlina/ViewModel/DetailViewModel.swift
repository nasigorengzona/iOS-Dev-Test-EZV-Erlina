//
//  DetailViewModel.swift
//  iOS-Dev-Test-EZV-Erlina
//
//  Created by erlina ng on 07/04/23.
//

import CoreData
import SwiftUI

class DetailViewModel : ObservableObject {
    @Published var savedEntities : [FavoriteItem] = []
    let container : NSPersistentContainer
    var isFave : Bool = false
  
    init() {
        container = NSPersistentContainer(name : "iOS_Dev_Test_EZV_Erlina")
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error loading core data : \(error)")
            }
        }
        fetchFave()
    }
    
    func fetchFave() {
        let req = NSFetchRequest<FavoriteItem>(entityName: "FavoriteItem")
        
        do {
            savedEntities = try container.viewContext.fetch(req)
        } catch let error {
            print("Error fetching : \(error)")
        }
        print(savedEntities)
    }
    
    func addFave(id : Int) {
        let newFave = FavoriteItem(context: container.viewContext)
        newFave.id = String(id)
        saveData()
    }
    
    func removeFromFave(id : Int) {
        for item in savedEntities {
            if item.id == String(id) {
                container.viewContext.delete(item)
            }
        }
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFave()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
    func checkFave(id : Int) -> Bool {
        for faveItem in savedEntities {
            if faveItem.id == String(id) {
                isFave = true
                return true
            }
        }
        return false
    }
}
