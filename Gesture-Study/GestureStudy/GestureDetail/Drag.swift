//
//  Drag.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/02.
//

import Foundation
import SwiftUI

struct Drag: GestureDetailProtocol {
  var gestureCategory: GestureCategory = .drag

  var enNm: String = "Drag"

  var korNm: String = "드래그"

  var swiftCode: String = """
//
//  DragExample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/02.
//

import SwiftUI

struct DragExample: View {
  // 이미지의 X 포지션
  @State private var positionX: CGFloat = 0
  // 이미지의 Y 포지션
  @State private var positionY: CGFloat = 0
  // 드래그 제스처
  private var dragGesture: some Gesture {
    DragGesture()
      .onChanged { action in
        // 드래그 상태가 변경될 때마다 애니메이션과 함께 포지션을 변경시킨다.
        withAnimation(.interactiveSpring()) {
          positionX = action.location.x
          positionY = max(action.location.y, 0)
        }
      }
  }

  var body: some View {
    GeometryReader { proxy in
      ZStack {
        Color.background
        imageToDrag
          .position(x: positionX, y: positionY)
          .gesture(dragGesture)
      }
      .onAppear {
        // View 가 나타날 때 이미지를 ZStack 의 정중앙에 위치시킨다.
        self.positionX = proxy.size.width / 2
        self.positionY = proxy.size.height / 2
      }
    }
  }
  // MARK: - 드래그 시킬 이미지
  private var imageToDrag: some View {
    VStack {
      Image(systemName: "iphone.circle.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 80, height: 80)
        .foregroundColor(.brand)

      Text("x: \\(String(format: "%.1f", positionX)) y: \\(String(format: "%.1f", positionY))")
        .font(.caption)
        .fontWeight(.semibold)
    }
  }
}
"""

  var image: Image = Image(systemName: "hand.draw.fill")

  var shortDescription: String = "어떤 물체를 누른 채로 이동시킬 수 있습니다. 아래 이미지를 이동시켜보세요"

  var exampleView: AnyView {
    AnyView(DragExample())
  }

  var detailDescription: AnyView {
    AnyView(DragAddInfo())
  }

}
