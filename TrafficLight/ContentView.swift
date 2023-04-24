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
    
    @State private var currentLight = CurrentLight.none
    
    @State private var redLightState = 0.3
    @State private var yellowLightState = 0.3
    @State private var greenLightState = 0.3
    
    @State private var redLightShine = 0.0
    @State private var yellowLightShine = 0.0
    @State private var greenLightShine = 0.0
    
    @State private var buttonText = "Start"
    
    private let lightOn = 1.0
    private let lightOff = 0.3
    
    private let shineOn = 20.0
    private let shineOff = 0.0
            
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                LightView(
                    color: .red,
                    opacity: redLightState,
                    shine: redLightShine
                )
                    .padding(.top, 16)
                    
                
                LightView(
                    color: .yellow,
                    opacity: yellowLightState,
                    shine: yellowLightShine
                )
                    .padding(.top, 16)
            
                
                LightView(
                    color: .green,
                    opacity: greenLightState,
                    shine: greenLightShine
                )
                    .padding(.top, 16)
                
                Spacer()
                ButtonView(
                    buttonText: buttonText,
                    action: startButtonTapped
                )
                    .padding()
            }
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
