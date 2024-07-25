//
//  SystemIcon.swift
//  SwiftUIBootcamp
//
//  Created by Maziar Layeghkar on 25.07.24.
//

import SwiftUI

struct SystemIcon: View {
    var body: some View {
        //Remember: the blue part of the Multicolor icons in SFSymbols are changeable.
        
        //Image(systemName: "heart.fill")
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
            //.resizable()
            //.aspectRatio(contentMode: .fit)
            .aspectRatio(contentMode: .fill)
            //.scaledToFill()
            //.scaledToFit()
            //.font(.system(size: 20))
            .font(.largeTitle)
            .frame(width: 300, height: 300)
            .clipped()
        
    }
}

#Preview {
    SystemIcon()
}
