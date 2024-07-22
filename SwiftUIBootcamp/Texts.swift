//
//  Texts.swift
//  SwiftUIBootcamp
//
//  Created by Maziar Layeghkar on 22.07.24.
//

import SwiftUI

struct Texts: View {
    var body: some View {
        Text("Hello, World! This is me back again and I am enjoying to practice my SwiftUI once again.".capitalized)
            .font(.system(size: 24, weight: .medium, design: .serif))
            .baselineOffset(5.0)
            .kerning(2.0)
            .multilineTextAlignment(.leading)
            .frame(width: 200, height: 100, alignment: .center)
            .minimumScaleFactor(0.5) //let the font to be 50% smaller than its real size
        
    }
}

#Preview {
    Texts()
}
