//
//  ContentView.swift
//  TrafficLight
//
//  Created by Dmitrii Melnikov on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    private enum CurrentLight {
        case none, red, yellow, green
    }
    
    private let lightOn = 1.0
    private let lightOff = 0.3
    
    private let shineOn = 20.0
    private let shineOff = 0.0
            
    @State private var currentLight = CurrentLight.none
    
    @State private var redLightState = 0.3
    @State private var yellowLightState = 0.3
    @State private var greenLightState = 0.3
    
    @State private var redLightShine = 0.0
    @State private var yellowLightShine = 0.0
    @State private var greenLightShine = 0.0
        
    @State private var buttonText = "Start"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                LightView(color: .red)
                    .padding(.top, 16)
                    .opacity(redLightState)
                    .shadow(color: .red, radius: redLightShine)
                LightView(color: .yellow)
                    .padding(.top, 16)
                    .opacity(yellowLightState)
                    .shadow(color: .yellow, radius: yellowLightShine)
                LightView(color: .green)
                    .padding(.top, 16)
                    .opacity(greenLightState)
                    .shadow(color: .green, radius: greenLightShine)
                Spacer()
                Button(action: startButtonTapped) {
                    Text(buttonText)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                .tint(.blue)
                .frame(width: 200, height: 50)
                .background(Capsule().stroke(.white, lineWidth: 4))
                .background(Capsule().foregroundColor(.blue))
            }
            .padding()
        }
    }
    
    private func startButtonTapped() {
        changeButtonText()
        changeColors()
    }
    
    private func changeColors() {
        switch currentLight {
        case .red:
            redLightState = lightOff
            yellowLightState = lightOn
            redLightShine = shineOff
            yellowLightShine = shineOn
            currentLight = .yellow
        case .yellow:
            yellowLightState = lightOff
            greenLightState = lightOn
            yellowLightShine = shineOff
            greenLightShine = shineOn
            currentLight = .green
        case .green:
            greenLightState = lightOff
            redLightState = lightOn
            greenLightShine = shineOff
            redLightShine = shineOn
            currentLight = .red
        default:
            redLightState = lightOn
            redLightShine = shineOn
            currentLight = .red
        }
    }
    
    private func changeButtonText() {
        if buttonText == "Start" {
            buttonText = "Next"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
