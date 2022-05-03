//
//  Pinch.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import Foundation
import SwiftUI

struct Pinch: GestureDetailProtocol {
  let gestureCategory: GestureCategory = .pinch

  let enNm: String = "Pinch to zoom"

  let korNm: String = "핀치 투 줌"

  let swiftCode: String = """
//
//  PinchToZoomExample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import SwiftUI

struct PinchToZoomExample: View {
  var body: some View {
    Image("SampleImage")
      .resizable()
      .scaledToFill()
      .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.666)
      .zoomable(showIndicators: true, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 1.174))
  }
}
// MARK: - Zoom 동작을 추가하는 Modifier
struct Zoomable: ViewModifier {
  private let min: CGFloat
  private let max: CGFloat
  private let showIndicators: Bool
  private let contentSize: CGSize
  @State private var scale: CGFloat = 1

  init(min: CGFloat, max: CGFloat, showIndicators: Bool, size: CGSize) {
    self.min = min
    self.max = max
    self.showIndicators = showIndicators
    self.contentSize = size
  }

  // 확대 제스처
  private var magnify: some Gesture {
    MagnificationGesture(minimumScaleDelta: min)
      .onChanged { action in
        // 확대비율을 얻을 수 있음
        scale = action.magnitude
      }
      .onEnded { action in
        // 최대, 최소 배율을 넘지 않도록 확대 작업을 종료한다.
        var new: CGFloat = 1
        new = Swift.max(min, action)
        new = Swift.min(max, new)
        scale = new
      }
  }
  // 더블 탭으로 확대 효과를 구현한다.
  private var doubleTap: some Gesture {
    TapGesture(count: 2)
      .onEnded {
        if scale < 1.5 {
          scale = max
        } else {
          scale = min
        }
      }
  }

  func body(content: Content) -> some View {
    ScrollView([.vertical, .horizontal], showsIndicators: showIndicators) {
      content
        .scaleEffect(scale, anchor: .center)
        .frame(width: contentSize.width * scale, height: contentSize.height * scale)
    }
    .frame(width: contentSize.width, height: contentSize.height, alignment: .center)
    // 핀치, 더블 탭 두 가지 제스처 모두 인식 가능하도록 설정한다.
    .gesture(ExclusiveGesture(doubleTap, magnify))
    .animation(.interactiveSpring(), value: scale)
  }
}
// MARK: View Extension - Zoomable
extension View {
  func zoomable(min: CGFloat = 1, max: CGFloat = 3, showIndicators: Bool = false, size contentSize: CGSize) -> some View {
      self
        .modifier(Zoomable(min: min, max: max, showIndicators: showIndicators, size: contentSize))
  }
}
"""

  var image: Image {
    Image(systemName: "arrow.up.backward.and.arrow.down.forward")
  }

  let shortDescription: String = "Pinch 는 두 개의 손가락을 서로 반대 방향으로 움직이는 제스처입니다. 주로 화면 확대나 축소에 쓰이는 제스처입니다."

  var exampleView: AnyView {
    AnyView(PinchToZoomExample())
  }

  var detailDescription: AnyView {
    AnyView(PinchToZoomAddInfo())
  }

}
