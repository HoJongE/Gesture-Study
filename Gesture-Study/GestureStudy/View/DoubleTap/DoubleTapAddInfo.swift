//
//  DoubleTapAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/29.
//

import SwiftUI
import CodeEditorView

struct DoubleTapAddInfo: View {

    var body: some View {
      VStack(alignment: .leading) {
        title
        SwiftCodeEditor("""
Text("Hello World")
  .onTapGesture(count: 2) {
    //두 번 탭할 때 실행할 코드
  }
""")
        .frame(height: 80)
        Text("위와 같이 사용자가 두 번 탭하거나 여러번 탭하는 것을 감지할 수 있습니다.")
          .addInfoText()
          .padding()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(Color.background)
    }

  private var title: some View {
    HStack {
      Image(ImageName.doubleTap)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.brand)
        .frame(height: 30)
      Text("Double tap")
        .addInfoTitle()
        .fontWeight(.semibold)
    }
    .padding()
  }
}

struct DoubleTapAddInfo_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapAddInfo()
    }
}
