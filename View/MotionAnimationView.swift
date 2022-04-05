//
//  MotionAnimationView.swift
//  Africa
//
//  Created by enjykhaled on 05/03/2022.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    //MARK: - Functions
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    //MARK: - Body
    var body: some View {
        GeometryReader   { geomtry in
            ZStack {
                ForEach(0...randomCircle , id:\.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale(): 1)
                        .position(x: randomCoordinate(max: geomtry.size.width), y:randomCoordinate(max: geomtry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(2)
                                .delay(randomSpeed())
                        )
                        .onAppear {
                            isAnimating = true
                        }
                }//:Loop
            }//:Zstack
            .drawingGroup()
        }//:geomrty
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
