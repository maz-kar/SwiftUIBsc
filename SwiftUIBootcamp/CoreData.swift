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
    @State var textFieldText: String = ""
    
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
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            //Every time that we tap the save, we need to update the @Published value and inside of this fetchRequest we are doing it.
            fetchRequest()
        } catch let error {
            print("Error saving: \(error)")
        }
    }
    
}

struct CoreData: View {
    @StateObject var vm = CoreDataViewModel()
    let backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var body: some View {
        Text("Hello")
//        VStack(spacing: 15) {
//            TextField("Add your Fruit here...", text: vm.$textFieldText)
//                .font(.headline)
//                .frame(maxWidth: .infinity)
//                .frame(height: 55)
//                .padding(.horizontal)
//                .background(Color(backgroundColor))
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//            
//            Button(action: {
//                vm.addFruit(text: vm.textFieldText)
//                print(vm.textFieldText)
//            }, label: {
//                Text("Submit")
//                    .font(.headline)
//                    .foregroundStyle(Color.white)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 55)
//                    .padding(.horizontal)
//                    .background(Color.blue)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//            })
//        }
//        .padding()
    }
}

#Preview {
    CoreData()
}
