//
//  Rotate.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import Foundation
import SwiftUI

struct Rotate: GestureDetailProtocol {

  let gestureCategory: GestureCategory = .rotate

  let framework: Framework = .SwiftUI

  let enNm: String = "Rotate"

  let korNm: String = "회전"

  let swiftCode: String = """
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
        Text("회전 각도: \\(Int(degree))")
          .foregroundColor(.subText)
          .bold()
      }
    }
  }
  // 회전시킬 이미지
  private var imageToRotate: some View {
    Image(systemName: "headphones")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 200)
      .foregroundColor(.brand)
  }
}
"""

  var image: Image {
    Image(systemName: "crop.rotate")
  }

  let shortDescription: String = "Rotate gesture 는 두 손가락을 회전시키는 제스쳐입니다. 아래 아이콘을 회전시켜보세요!"

  var exampleView: AnyView {
    AnyView(RotateExample())
  }

  var detailDescription: AnyView {
    AnyView(RotateAddInfo())
  }

}
