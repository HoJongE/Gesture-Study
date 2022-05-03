//
//  SwipeToUnlock.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import Foundation
import SwiftUI

struct SwipeToUnlock: GestureDetailProtocol {
  let gestureCategory: GestureCategory = .swipe

  let enNm: String = "Swipe to unlock"

  let korNm: String = "밀어서 잠금해제"

  let swiftCode: String = """
//
//  SwipeToUnlockExample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import SwiftUI
// MARK: - 밀어서 잠금해제 예제
struct SwipeToUnlockExample: View {
  @State private var unlock: Bool = false
  var body: some View {
    VStack {
      Image(systemName: unlock ? "lock.open.fill" : "lock.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 150)
        .foregroundColor(.black)
      SwipeToUnlock.Unlock(unlock: $unlock)
        .padding(.top, 32)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  }
}
// MARK: - 밀어서 잠금해제
extension SwipeToUnlock {

  struct Unlock: View {

    @State private var dragAmount: CGSize = .zero
    @Binding var unlock: Bool
    @State private var animation: Bool = false
    @State private var isDragging: Bool = false
    // 스와이프 제스처
    private var swipe: some Gesture {
      // 드래그 제스처로 스와이프 여부를 판단한다.
      DragGesture(coordinateSpace: .local)
        .onChanged { action in
          isDragging = true
          dragAmount = determineOffset(dragValue: action.translation)
        }
        .onEnded { action in
          isDragging = false
          // 예측 종료 지점이 특정 값 이상이면, 스와이프가 충분히 된 것으로 판단해 잠금을 해제함
          if onEnded(predicted: action.predictedEndTranslation) {
            dragAmount.width = 233
            unlock = true
          } else {
            dragAmount = .zero
            unlock = false
          }
        }
    }
    var body: some View {
      ZStack {
        rectangle
        HStack(alignment: .center) {
          swipeButton
            .offset(dragAmount)
            .gesture(swipe)
            .animation(.easeInOut(duration: 0.2), value: dragAmount)
          Spacer()
          if !isDragging && !unlock {
            animatedText()
              .transition(.opacity.animation(.linear(duration: 0.3)))
          }
          Spacer()
        }
      }
      .frame(width: 300, height: 60)
    }
    // 애니메이션 밀어서 잠금해제 텍스트
    private func animatedText() -> some View {
      ZStack {
        Text("밀어서 잠금해제")
          .font(.title)
          .fontWeight(.regular)
          .foregroundColor(.stuText)
        HStack(spacing: 0) {
          ForEach("밀어서 잠금해제".map { String($0) }, id: \\.self) { text in
            Text(text)
              .font(.title)
              .fontWeight(.regular)
              .foregroundColor(.white)
          }
        }
        .mask {
          Rectangle()
            .fill(LinearGradient(colors: [Color.white.opacity(0.3), .white.opacity(0.8), .white.opacity(0.3)], startPoint: .top, endPoint: .bottom))
            .rotationEffect(.init(degrees: 50))
            .offset(x: -250)
            .offset(x: animation ? 500 : 0)
        }
        .onAppear(perform: startAnimation)
      }
    }
    // 애니메이션을 시작하는 함수
    private func startAnimation() {
      animation = false
      withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
        animation.toggle()
      }
    }
    // Drag gesture 가 일정 범위를 넘어가지 못하도록 tranlsation 을 변환하는 함수
    private func determineOffset(dragValue: CGSize) -> CGSize {
      var manufacturedValue: CGSize = .zero
      manufacturedValue.width = max(0, dragValue.width)
      manufacturedValue.width = min(233, manufacturedValue.width)
      manufacturedValue.height = 0
      return manufacturedValue
    }

    // Drag gesture 의 종료 지점을 계싼하는 함수
    private func onEnded(predicted: CGSize) -> Bool {
      return predicted.width > 220
    }
    // 밀어서 잠금해제 백그라운드
    private var rectangle: some View {
      RoundedRectangle(cornerRadius: 8)
        .fill(LinearGradient(colors: [.stuTop, .stuBottom], startPoint: .top, endPoint: .bottom))
        .overlay(RoundedRectangle(cornerRadius: 8)
          .strokeBorder(Color.stuStroke, lineWidth: 1.7, antialiased: true))
    }
    // 화살표 버튼
    private var swipeButton: some View {
      Image(systemName: "arrow.right")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding()
        .foregroundColor(.stuArrow)
        .background(
          RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient(colors: [.stuBtnTop, .stuBtnCenter, .stuBtnBottom], startPoint: .top, endPoint: .bottom))
            .padding(4)
        )
    }
  }
}
"""

  var image: Image {
    Image(ImageName.swipeToUnlock)
  }

  let shortDescription: String = "Swipe는 직선으로 손가락을 움직이는 제스처입니다. 오랫동안 아이폰의 아이덴티티였던 밀어서 잠금해제를 해보세요!"

  var exampleView: AnyView {
    AnyView(SwipeToUnlockExample())
  }

  var detailDescription: AnyView {
    AnyView(SwipeToUnlockAddInfo())
  }

}
