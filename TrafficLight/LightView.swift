//
//  LightView.swift
//  TrafficLight
//
//  Created by Dmitrii Melnikov on 20.04.2023.
//

import SwiftUI

struct LightView: View {
    let color: Color
    let opacity: Double
    let shine: Double
    
    var body: some View {
        
        Circle()
            .foregroundColor(color)
            .frame(width: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .opacity(opacity)
            .shadow(color: color, radius: shine)
    }
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView(color: .red, opacity: 1.0, shine: 0)
    }
}
