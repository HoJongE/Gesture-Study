//
//  RotateAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import SwiftUI

struct RotateAddInfo: View {
  var body: some View {
    VStack(alignment: .leading) {
      title
      SwiftCodeEditor("""
@GestureState private var degree: Double = 0
private var rotateGesture: some Gesture {
    RotationGesture()
      .updating($degree) { current, gesture, _ in
        gesture = current.degrees
      }
  }
""")
      .frame(height: 150)
      Text("SwiftUI 에서 **Rotate gesture** 를 기본적으로 지원해줍니다. 위와 같이 **Gesture value** 에서 회전 각도를 얻을 수 있어, 아래와 같이 이미지를 회전시킬 수 있습니다.")
        .addInfoText()
        .padding()
      SwiftCodeEditor("""
Image(systemName: "headphones")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 200)
      .foregroundColor(.brand)
      .rotationEffect(.degrees(degree))
""")
      .frame(height: 110)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background.edgesIgnoringSafeArea(.all))
  }

  private var title: some View {
    HStack {
      Image(systemName: "crop.rotate")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.brand)
        .frame(height: 30)
      Text("Rotate")
        .addInfoTitle()
        .fontWeight(.semibold)
    }
    .padding()
  }
}

struct RotateAddInfo_Previews: PreviewProvider {
  static var previews: some View {
    RotateAddInfo()
  }
}
