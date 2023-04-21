//
//  LightView.swift
//  TrafficLight
//
//  Created by Dmitrii Melnikov on 20.04.2023.
//

import SwiftUI

struct LightView: View {
    let color: Color
    
    var body: some View {
        
        Circle()
            .foregroundColor(color)
            .frame(width: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView(color: .red)
    }
}
