//
//  PinchToZoomAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import SwiftUI

struct PinchToZoomAddInfo: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading) {
        title
        Text("핀치는 손가락을 서로 반대 방향으로 움직이는 제스처로, 주로 어떤 아이템을 확대하거나 축소할 때 사용하는 제스처입니다.")
          .addInfoText()
          .padding()
        SwiftCodeEditor("""
  MagnificationGesture()
      .onChanged { action in
        // 현재 핀치 제스처 진행 정도를 나타냄
        action.magnitude
      }
  """)
        .frame(height: 120)
        Text("위와 같이 SwiftUI 에서 **MagnificationGesture** 라는 형태로 지원하는 제스처이며, **Gesture Value** 에서 확대나 축소 비율을 얻을 수 있습니다.")
          .addInfoText()
          .padding()
        SwiftCodeEditor("""
  @GestureState var scale: CGFloat = 1.0

  Image("tesla")
      .resizable()
      .scaledToFill()
      .frame(width: UIScreen.main.bounds.width, height: 200)
      .scaleEffect(scale)
      .gesture(MagnificationGesture()
          .updating($scale, body: { (value, scale, trans) in
              scale = value.magnitude
          })
  )
  """)
        .frame(height: 240)
        Text("위와 같이 **scaleEffect** 와 함께 사용해 이미지를 확대하거나 축소할 수 있습니다.")
          .addInfoText()
          .padding()
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background)
  }

  private var title: some View {
    HStack {
      Image(systemName: "arrow.up.left.and.arrow.down.right")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.brand)
        .frame(height: 30)
      Text("Pinch")
        .addInfoTitle()
        .fontWeight(.semibold)
    }
    .padding()
  }
}

struct PinchToZoomAddInfo_Previews: PreviewProvider {
  static var previews: some View {
    PinchToZoomAddInfo()
  }
}
