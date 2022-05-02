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
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 0) {
        title
        dragGestureCode.frame(height: 160)
        Text("위와 같이 Drag 제스처를 정의할 수 있습니다. Drag 상태가 변하는 동안 onChanged 에서 정의된 클로저가 실행되며, Drag 제스처가 종료되는 경우 onEnded 에서 정의된 클로저가 실행됩니다.")
          .foregroundColor(.subText)
          .fontWeight(.light)
          .padding()

        Text("Drag gesture value")
          .fontWeight(.semibold)
          .padding(.horizontal)

        Text("Drag 제스처의 상태가 변할 때마다 Drag gesture Value 를 전달해줍니다. 해당 Value 에서 다음 정보들을 사용할 수 있습니다.")
          .fontWeight(.light)
          .foregroundColor(.subText)
          .padding()
        location
        translation
        startLocation
        predictedLocation
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(Color.background)
    }
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

  private var location: some View {
    Group {
      Text("Location").fontWeight(.semibold)
        .padding(.bottom, 4)
      Text("Drag 제스처의 현재 위치를 나타냄")
        .fontWeight(.light)
        .font(.subheadline)
        .padding(.bottom, 12)
    }
    .padding(.horizontal)
  }

  private var translation: some View {
    Group {
      Text("Translation").fontWeight(.semibold)
        .padding(.bottom, 4)
      Text("Drag 제스처의 시작 위치에서부터의 변화량을 나타냄")
        .fontWeight(.light)
        .font(.subheadline)
        .padding(.bottom, 12)
    }
    .padding(.horizontal)
  }

  private var startLocation: some View {
    Group {
      Text("startLocation").fontWeight(.semibold)
        .padding(.bottom, 4)
      Text("Drag 제스처의 시작 위치를 나타냄")
        .fontWeight(.light)
        .font(.subheadline)
        .padding(.bottom, 12)
    }
    .padding(.horizontal)
  }

  private var predictedLocation: some View {
    Group {
      Text("PredictedEndLocation").fontWeight(.semibold)
        .padding(.bottom, 4)
      Text("현재 Drag 의 위치와 속도를 고려한 예측 종료 지점을 나타냄")
        .fontWeight(.light)
        .font(.subheadline)
        .padding(.bottom, 12)
    }
    .padding(.horizontal)
  }
}

struct DragAddInfo_Previews: PreviewProvider {
  static var previews: some View {
    DragAddInfo()
  }
}
