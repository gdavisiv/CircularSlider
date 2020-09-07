//
//  ContentView.swift
//  CircularSlider
//
//  Created by George Davis IV on 9/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var size = UIScreen.main.bounds.width - 100
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .stroke(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
            }
        }
    }
}
