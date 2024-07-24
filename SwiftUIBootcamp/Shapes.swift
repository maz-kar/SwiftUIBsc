//
//  Shapes.swift
//  SwiftUIBootcamp
//
//  Created by Maziar Layeghkar on 24.07.24.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        //Circle()
        //Ellipse()
        //Capsule(style: .circular)
        RoundedRectangle(cornerRadius: 10)

            //.stroke(Color.green, lineWidth: 5.0)
            //.stroke(Color.orange, style: StrokeStyle(lineWidth: 10.0, lineCap: .round, dash: [30]))
            .trim(from: 0.4, to: 1)
            //.stroke(Color.purple, lineWidth: 20)
            .frame(width: 200, height: 100)
    }
}

#Preview {
    Shapes()
}
