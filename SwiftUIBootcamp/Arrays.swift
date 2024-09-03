//
//  Arrays.swift
//  SwiftUIBootcamp
//
//  Created by Maziar Layeghkar on 27.08.24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArraysViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    private func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: "Sara", points: 0, isVerified: false)
        let user3 = UserModel(name: nil, points: 13, isVerified: true)
        let user4 = UserModel(name: "Louisa", points: 70, isVerified: false)
        let user5 = UserModel(name: "Delia", points: 50, isVerified: true)
        let user6 = UserModel(name: "Delali", points: 43, isVerified: true)
        let user7 = UserModel(name: nil, points: 100, isVerified: true)
        let user8 = UserModel(name: "Samantha", points: 15, isVerified: false)
        let user9 = UserModel(name: "Carolin", points: 11, isVerified: true)
        let user10 = UserModel(name: "Katy", points: 5, isVerified: true)
        
        self.dataArray.append(contentsOf:
                                [ user1, user2, user3, user4, user5, user6, user7, user8, user9, user10 ])
    }
    
    private func updateFilteredArray() {
         //3 ways to modify an array'd data:
        //sort
        /*
        //filteredArray = dataArray.sorted (by: { $0.points > $1.points })
        */
        
        //filter 
        /*
    //filteredArray = dataArray.filter( { $0.points >= 20 }).sorted(by: { $0.points > $1.points })
    //filteredArray = dataArray.filter( { !$0.isVerified })
    //filteredArray = dataArray.filter( { $0.name.contains("i") } )
         */
        
        //map
//        mappedArray = dataArray.map({ user -> String in
//            return user.name
//        })
        
        //mappedArray = dataArray.map({ $0.name ?? "Error" }) //Remember: that for doing map, we need to have at least one property inside of that source type (here name: String) to have the same type as the destination type.
        
        //compactMap
        /*
         The difference between map and compactMap is:
         if in our model, we have optional name: String? , with map we cannot handle it, as here: user -> String in, we say for every user, we need to absolutely return a String
        */
        
        mappedArray = dataArray.compactMap( { $0.name } )

    }
}

struct Arrays: View {
    @StateObject var vm = ArraysViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.mappedArray, id: \.self) { name in //We need this hashable environment: id: \.self cause String does not conform to Identifiable like the filteredArray does
                    Text(name)
                        .font(.title)
                }
                //ForEach(vm.dataArray) { user in
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                }
//                .foregroundStyle(.white)
//                .padding()
//                .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
//                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    Arrays()
}
