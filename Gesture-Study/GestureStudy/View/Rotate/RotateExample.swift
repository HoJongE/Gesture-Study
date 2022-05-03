//
//  RotateExample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import SwiftUI

struct RotateExample: View {
  // 회전 각도를 나타내는 Gesture state
  @GestureState private var degree: Double = 0

  // 회전 제스처
  private var rotateGesture: some Gesture {
    RotationGesture()
      .updating($degree) { current, gesture, _ in
        gesture = current.degrees
      }
  }
  var body: some View {
    ZStack {
      Color.background.edgesIgnoringSafeArea(.all)
      VStack(spacing: 16) {
        imageToRotate
          .rotationEffect(.degrees(degree))
          .animation(.interactiveSpring(), value: degree)
          .gesture(rotateGesture)
        Text("회전 각도: \(Int(degree))")
          .foregroundColor(.subText)
          .bold()
      }
    }
  }

  private var imageToRotate: some View {
    Image(systemName: "headphones")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 200)
      .foregroundColor(.brand)
  }
}

struct RotateExample_Previews: PreviewProvider {
  static var previews: some View {
    RotateExample()
  }
}
