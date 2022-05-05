//
//  LongPressAndDragAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/05.
//

import SwiftUI

struct LongPressAndDragAddInfo: View {

  var body: some View {
    VStack(alignment: .leading) {
      title
      Text("Sequence Gesture")
        .addInfoSubTitle()
        .padding(.horizontal)
      Text("SwiftUI 에서 제공하는 **Sequence Gesture** 로, 두 개의 제스처를 서로 연결할 수 있습니다.")
        .addInfoText()
        .padding()
      SwiftCodeEditor("""
private var longPressToDrag: some Gesture {
  LongPressGesture(minimumDuration: 1)
    .sequenced(before: DragGesture())
}
""")
      .frame(height: 90)
      Text("위 코드로 드래그 제스처를 실행하기 전에, **LongPress Gesture** 를 선행하도록 강제할 수 있습니다. SwiftUI 에서 지원하는 여러가지 제스처를 전부 조합할 수 있으며, 개별 제스처의 **onChanged**, **onEnded** 함수를 모두 활용할 수 있습니다.")
        .addInfoText()
        .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
  }

  private var title: some View {
    HStack {
      Image(ImageName.longPress)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.brand)
        .frame(height: 30)

      Text("Long press to drag")
        .addInfoTitle()
        .fontWeight(.semibold)
    }
    .padding()
  }
}

struct LongPressAndDragAddInfo_Previews: PreviewProvider {
  static var previews: some View {
    LongPressAndDragAddInfo()
  }
}
