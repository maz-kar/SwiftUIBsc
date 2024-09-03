//
//  CoreData.swift
//  SwiftUIBootcamp
//
//  Created by Maziar Layeghkar on 03.09.24.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loading Core Data. \(error)")
            }
        }
        
        fetchRequest()
    }
    
    func fetchRequest() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error)")
        }
    }
    
}

struct CoreData: View {
    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoreData()
}
