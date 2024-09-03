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
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        
        saveData()
    }
    
    func deleteFruit(offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let fruitEntity = savedEntities[index]
        container.viewContext.delete(fruitEntity)
        
        saveData()
    }
    
    func updateFruit(entity: FruitEntity) {
        let currentEntity = entity.name ?? ""
        let newEntity = currentEntity + "!"
        entity.name = newEntity
        
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
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Add your Fruit here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(backgroundColor))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    //Good practice to not add empty row if user taps on empty textFieldText
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(.horizontal)
            List {
                ForEach(vm.savedEntities) { entity in
                    Text(entity.name ?? "No Name")
                        .onTapGesture {
                            vm.updateFruit(entity: entity)
                        }
                }
                .onDelete(perform: vm.deleteFruit)
            }
            .listStyle(.plain)
            .navigationTitle("Fruits ")
        }
    }
    
}

#Preview {
    CoreData()
}
