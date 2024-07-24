//
//  Colors.swift
//  SwiftUIBootcamp
//
//  Created by Maziar Layeghkar on 24.07.24.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        //var color = #colorLiteral()
        var firstCustomColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                //Color.primary
                //Color(firstCustomColor)
                Color("CustomColor")
            )
            .frame(width: 200, height: 100)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -10, y: 20)
    }
}

#Preview {
    Colors()
}
