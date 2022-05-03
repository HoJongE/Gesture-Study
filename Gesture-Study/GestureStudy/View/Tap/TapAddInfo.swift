//
//  TapAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/29.
//

import SwiftUI
import CodeEditorView

struct TapAddInfo: View {
  @Environment(\.colorScheme) private var colorScheme: ColorScheme
  var body: some View {
    VStack(alignment: .leading) {
      title.padding()
      Text("단순히 화면을 한 번 터치하는 동작입니다.")
        .addInfoText()
        .padding(.horizontal)

      onTapGestureCode
      Text("위와 같이 SwiftUI 의 View 에서 onTapGesture 함수로 탭 이벤트를 감지할 수 있습니다.")
        .addInfoText()
        .padding()
      getPositionCode
      Text("이 예제에서는 Tap 제스처를 위와 같은 제스처로 감지했습니다. 편법이긴 하지만 Tap 제스처의 위치를 알고 싶은 경우 위와 같은 제스처를 선언해 사용할 수 있습니다.")
        .addInfoText()
        .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background)
  }
  private var title: some View {
    HStack(alignment: .center) {
      Image(systemName: "hand.tap.fill")
        .imageScale(.large)
        .foregroundColor(.brand)
      Text("Tap")
        .addInfoTitle()
    }
  }

  private var onTapGestureCode: some View {
    SwiftCodeEditor("""
Text("Hello World")
  .onTapGesture {
     print("Text Tapped!")
  }
""")
    .frame(height: 80)
  }

  private var getPositionCode: some View {
    SwiftCodeEditor("""
private var tapGesture: some Gesture {
    DragGesture(minimumDistance: 0)
      .onEnded { action in
        print(action.location)
      }
  }
""")
    .frame(height: 110)
  }
}

struct TapAddInfo_Previews: PreviewProvider {
  static var previews: some View {
    TapAddInfo()
      .preferredColorScheme(.dark)
  }
}
