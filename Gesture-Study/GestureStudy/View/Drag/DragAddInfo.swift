//
//  DragAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/02.
//

import SwiftUI
import CodeEditorView

struct DragAddInfo: View {
  @Environment(\.colorScheme) private var colorScheme
  var body: some View {
    VStack(alignment: .leading) {
      title
      dragGestureCode.frame(height: 160)
      Text("위와 같이 Drag 제스처를 정의할 수 있습니다. Drag 상태가 변하는 동안 onChanged 에서 정의된 클로저가 실행되며, Drag 제스처가 종료되는 경우 onEnded 에서 정의된 클로저가 실행됩니다.")
        .foregroundColor(.subText)
        .fontWeight(.light)
        .padding()

    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background)
  }

  private var title: some View {
    HStack {
      Image(systemName: "hand.draw.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.brand)
        .frame(height: 30)
      Text("Drag")
        .foregroundColor(.subText)
        .font(.title2)
        .fontWeight(.semibold)
    }
    .padding()
  }

  private var dragGestureCode: some View {
    CodeEditor(text: .constant("""
private var dragGesture: some Gesture {
  DragGesture()
    .onChanged { action in
      print(action)
    }
    .onEnded {
      print(action)
    }
}
"""), position: .constant(.init()), messages: .constant(.init()), language: .swift)
    .environment(\.codeEditorTheme, colorScheme == .dark ? .defaultDark : .defaultLight)
  }
}

struct DragAddInfo_Previews: PreviewProvider {
  static var previews: some View {
    DragAddInfo()
  }
}
