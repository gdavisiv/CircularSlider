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
                .preferredColorScheme(.dark)
                .navigationTitle("Wallet")
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
    @State var progress : CGFloat = 0
    @State var angle : Double = 0
    
    var body: some View {
        VStack{
            ZStack{
                //Base Circle Style
                Circle()
                    .stroke(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
                
                //Green Progression Line
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color(#colorLiteral(red: 0, green: 0.8357462287, blue: 0, alpha: 1)), style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
                    .rotationEffect(.init(degrees: -90))
                
                //Inner Curved Starting Point
                Circle()
                    .fill(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: -90))
                
                //Drag Circle
                Circle()
                    .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: angle))
                    //Adding Drag Gesture
                    .gesture(DragGesture().onChanged(onDrag(value:)))
                    .rotationEffect(.init(degrees: -90))
            }
        }
    }
    
    func onDrag(value: DragGesture.Value){
        //Calculate the Radians
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        
        //ATan2 will give you values between -180 to 180, you
        //Also will need to remove the drag gesure size of 55
        //so divide 55/2 = 27.5
        //55 is the size of the Drag Circle
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        
        //Convert to an Angle
        var angle = radians * 180 / .pi
        
        //Simple technique from 0->360
        //ex: 360 - 60 = 300
        if angle < 0{angle = 360 + angle}
        
        withAnimation(Animation.linear(duration: 0.15)){
            
            //progress along the circle
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
    }
}
