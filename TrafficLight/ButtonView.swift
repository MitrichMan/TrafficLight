//
//  ButtonView.swift
//  TrafficLight
//
//  Created by Dmitrii Melnikov on 24.04.2023.
//

import SwiftUI

struct ButtonView: View {
    let buttonText: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
        .tint(.blue)
        .frame(width: 200, height: 50)
        .background(Capsule().stroke(.white, lineWidth: 4))
        .background(Capsule().foregroundColor(.blue))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "Hello World", action: {})
    }
}

