//
//  LongPress.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/01.
//

import Foundation
import SwiftUI

struct LongPress: GestureDetailProtocol {

  let gestureCategory: GestureCategory = .tap

  let enNm: String = "Long press"

  let korNm: String = "길게 누르기"

  let swiftCode: String = """
//
//  LongPressExample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/01.
//

import SwiftUI
// MARK: - 롱 프레스 예제
struct LongPressExample: View {

  // 롱 프레스 최소 시간
  @State private var minimumDuration: Float = 2
  // 롱 프레스 최대 거리
  @State private var maximumDistance: Float = 150
  // 롱 프레스 상태를 나타냄
  @GestureState private var isPressed: Bool = false
  // 롱 프레스 완료 상태 -> Alert 를 발생시킴
  @State private var completed: Bool = false
  // 탭 포지션
  @State private var tapLocation: CGPoint = .zero
  // 롱 프레스 제스처
  private var longPressGesture: some Gesture {
    LongPressGesture(minimumDuration: Double(minimumDuration), maximumDistance: CGFloat(maximumDistance))
      .updating($isPressed) { current, gesture, transaction in
        gesture = current
        transaction.animation = .linear(duration: CGFloat(minimumDuration))
      }
      .onEnded { action in
        self.completed = action
      }
    // 탭 포지션을 얻기 위해 동시 제스처를 처리하는 simultaneously 사용
      .simultaneously(with: dragGesture)
  }
  // 탭 포지션을 얻기 위한 dragGesture
  private var dragGesture: some Gesture {
    DragGesture(minimumDistance: 0)
      .onChanged { action in
        tapLocation = action.startLocation
      }
  }

  var body: some View {
    VStack(spacing: 0) {
      ZStack {
        Color.background
          .zIndex(0)
        bigCircle
          .position(tapLocation)
          .zIndex(1)
          .opacity(isPressed ? 1 : 0)
          .animation(nil, value: isPressed)
        longPressCircle
          .position(tapLocation)
          .zIndex(2)
          .opacity(isPressed ? 1 : 0)
      }
      .gesture(longPressGesture)
      minimumDurationSlider
      maximumDistanceSlider
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background)
    .alert(isPresented: $completed) {
      Alert(title: Text("Long press triggered"), message: Text("롱 프레스 발동!!!"), dismissButton: .default(Text("확인")))
    }
  }
// MARK: - 최소 시간 슬라이더
  private var minimumDurationSlider: some View {
    HStack {
      Text("최소 시간")
        .padding(.leading, 14)
      Slider(value: $minimumDuration, in: 1...3, step: 0.5)
        .accentColor(isPressed ? .gray : .brand)
      Text("\\(String(format: "%.1f", minimumDuration))초")
        .frame(width: 35, alignment: .trailing)
        .padding(.trailing, 14)
    }
    .disabled(isPressed)
    .padding(.vertical, 4)
    .font(.caption)
    .foregroundColor(.white)
    .background(Color.black)
  }
// MARK: - 최대 거리 슬라이더
  private var maximumDistanceSlider: some View {
    HStack {
      Text("최대 거리")
        .padding(.leading, 14)
      Slider(value: $maximumDistance, in: 100...200, step: 1)
        .accentColor(isPressed ? .gray : .brand)
      Text("\\(Int(maximumDistance))")
        .frame(width: 35, alignment: .trailing)
        .padding(.trailing, 14)
    }
    .disabled(isPressed)
    .background(Color.black)
    .font(.caption)
    .foregroundColor(.white)
  }
}

extension LongPressExample {
  // MARK: - 롱 프레스 시 나오는 원
  private var longPressCircle: some View {
    Circle()
      .fill(Color.brand)
      .frame(width: isPressed ? CGFloat(maximumDistance * 2) : 0, height: isPressed ? CGFloat(maximumDistance * 2) : 0, alignment: .center)
  }
  // MARK: - 롱 프레스 시 나오는 최대 크기의 원
  private var bigCircle: some View {
    Circle()
      .fill(Color.brand.opacity(0.6))
      .frame(width: CGFloat(maximumDistance * 2), height: CGFloat(maximumDistance * 2))
  }
}
"""

  var image: Image {
    Image(ImageName.longPress)
  }

  let shortDescription: String = "하나 이상의 손가락을 누르고, 최소 시간 동안 손가락을 올려놓으면 동작이 트리거됩니다.아래 화면을 길게 터치해보세요!"
  var exampleView: AnyView {
    AnyView(LongPressExample())
  }

  var detailDescription: AnyView {
    AnyView(LongPressAddInfo())
  }

}
