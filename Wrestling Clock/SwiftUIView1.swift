//
//  SwiftUIView1.swift
//  Wrestling Clock
//
//  Created by Phillip Mantatsky on 11/28/23.
//

import SwiftUI

struct SwiftUIView1: View {
    @State private var timeMinutes = 2
    @State private var timeSeconds = 0
    @State private var timerIsOn = false
    @State private var redScore = 0
    @State private var greenScore = 0
    @State private var bloodTimeMinutesRed = 5
    @State private var bloodTimeSecondsRed = 0
    @State private var bloodTimeMinutesGreen = 5
    @State private var bloodTimeSecondsGreen = 0
    @State private var isBloodTimeActiveRed = false
    @State private var isBloodTimeActiveGreen = false
    @State private var bloodTimeOn = false
    @State private var period = 1
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var wrestler1: String
    var wrestler2: String
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: { isBloodTimeActiveRed.toggle()
                    }) { Text(isBloodTimeActiveRed ? "Regular Time" : "Blood Time Red")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .font(.title3)
                    }
                    Button(action: { isBloodTimeActiveGreen.toggle()
                    }) { Text(isBloodTimeActiveGreen ? "Regular Time" : "Blood Time Green")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .font(.title3)
                    }
                }
                Text("Wrestling Clock")
                    .font(.title)
                    .bold()
                    .frame(width: 300, height: 50)
                if isBloodTimeActiveRed == true && isBloodTimeActiveGreen != true {
                    Text("\(bloodTimeMinutesRed):\(String(format: "%02d", bloodTimeSecondsRed))")
                        .frame(width: 400, height: 150)
                        .font(.custom("Times New Roman", size: 100))
                        .foregroundColor(Color(red: 0.9, green: 0.2, blue: 0.1))
                        .position(x: 200, y: 50)
                        .onReceive(timer) { _ in
                            if bloodTimeOn == true {
                                if bloodTimeSecondsRed > 0 {
                                    bloodTimeSecondsRed -= 1
                                } else if timeMinutes > 0 {
                                    bloodTimeMinutesRed -= 1
                                    bloodTimeSecondsRed = 59
                                }
                            }
                        }
                        .onTapGesture {
                            bloodTimeOn.toggle()
                        }
                }
                else if isBloodTimeActiveGreen == true && isBloodTimeActiveRed != true {
                    Text("\(bloodTimeMinutesGreen):\(String(format: "%02d", bloodTimeSecondsGreen))")
                        .frame(width: 400, height: 150)
                        .font(.custom("Times New Roman", size: 100))
                        .foregroundColor(Color(red: 0.2, green: 0.8, blue: 0.1))
                        .position(x: 200, y: 50)
                        .onReceive(timer) { _ in
                            if bloodTimeOn == true {
                                if bloodTimeSecondsGreen > 0 {
                                    bloodTimeSecondsGreen -= 1
                                } else if timeMinutes > 0 {
                                    bloodTimeMinutesGreen -= 1
                                    bloodTimeSecondsGreen = 59
                                }
                            }
                        }
                        .onTapGesture {
                            bloodTimeOn.toggle()
                        }
                } else {
                    Text("\(timeMinutes):\(String(format: "%02d", timeSeconds))")
                        .frame(width: 400, height: 150)
                        .font(.custom("Times New Roman", size: 100))
                        .onReceive(timer) { _ in
                            if timerIsOn == true {
                                if timeSeconds > 0 {
                                    timeSeconds -= 1
                                } else if timeMinutes > 0 {
                                    timeMinutes -= 1
                                    timeSeconds = 59
                                }
                            } else {
                                if period == 4 {
                                    timeMinutes = 1
                                    
                                    
                                }
                                if period == 5 {
                                    timeMinutes = 0
                                    timeSeconds = 30
                                }
                            }
                            
                        }
                    
                        .onTapGesture {
                            timerIsOn.toggle()
                        }
                        .position(x: 200, y: 50)
                }
                
                HStack {
                    Text("Red: \(wrestler1)")
                        .font(.title)
                    Spacer().frame(width: 90)
                    Text("Green: \(wrestler2)")
                        .font(.title)
                }
                .position(x: 200, y: -80)
                HStack {
                    Text("\(redScore)")
                        .foregroundColor(Color(red: 0.9, green: 0.2, blue: 0.1))
                        .onTapGesture {
                            redScore += 1
                        }
                    Spacer().frame(width: 160)
                    Text("\(greenScore)")
                        .foregroundColor(Color(red: 0.2, green: 0.8, blue: 0.1))
                        .onTapGesture {
                            greenScore += 1
                        }
                }
                .position(x: 200, y: -200)
                .font(.custom("Times New Roman", size: 100))
            }
            Button(action: {
                if redScore > 0 {
                    redScore -= 1
                }
            }) { Text("-1")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                    .font(.title3)
            }
            .position(x: 95, y: 450)
            Button(action: {
                if greenScore > 0 {
                    greenScore -= 1
                }
            }) { Text("-1")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                    .font(.title3)
            }
            .position(x: 310, y: 450)
            Button(action: { timeMinutes = 2
                timeSeconds = 0
                redScore = 0
                greenScore = 0
                bloodTimeMinutesRed = 5
                bloodTimeSecondsRed = 0
                timerIsOn = false
                bloodTimeOn = false
                bloodTimeMinutesGreen = 5
                bloodTimeSecondsGreen = 0
            }) { Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .font(.title3)
            }
            .position(x: 200, y: 700)
            HStack{
                Button(action: {
                    redScore += 2
                }) { Text("+2")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .font(.title3)
                }
                .position(x: 60, y: 520)
                Button(action: {
                    redScore += 3
                }) { Text("+3")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .font(.title3)
                }
                .position(x: -70, y: 520)
            }
            
            HStack {
                Button(action: {
                    greenScore += 3
                }) { Text("+3")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .font(.title3)
                }
                .position(x: 350, y: 520)
                Button(action: {
                    greenScore += 2
                }) { Text("+2")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .font(.title3)
                }
                .position(x: 80, y: 520)
                
            }
            HStack {
                Text("Period #")
                Picker("", selection: $period) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                
                .pickerStyle(.segmented)
                .frame(width: 200, height: 50, alignment: .center)
                .padding()
            }
            .position(x: 200, y: 610)
        }
        .onChange(of: period) { newPeriod in
            timeMinutes = 2
            timeSeconds = 0
            timerIsOn = false
        }
        
    }
    
    struct SwiftUIView1_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView1(wrestler1: "Wrestler 1", wrestler2: "Wrestler 2")
        }
    }
}
