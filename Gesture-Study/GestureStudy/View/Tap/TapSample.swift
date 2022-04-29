//
//  TapSample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/29.
//

import SwiftUI

struct TapSample: View {

  // 탭 포지션을 모아놓은 배열
  @State private var positions: [CGPoint] = []

  private var tapGesture: some Gesture {
    // SwiftUI 에서 Tap event 의 position 을 얻기 위해, Drag gesture 을 사용함
    DragGesture(minimumDistance: 0)
      .onEnded { action in
        positions.append(action.location)
      }
  }
  var body: some View {
    ZStack {
      Color.background
      // 유저가 탭한 포지션에 원 그리기
      ForEach(positions, id: \.self) { position in
        TapEventCircle(position) {
          positions.removeAll(where: { $0 == position })
        }
      }
    }
    .gesture(tapGesture)
  }
}

// CGPoint ForEach 사용을 위한 Hashable 프로토콜 구현
extension CGPoint: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(x)
    hasher.combine(y)
  }
}

// MARK: - 탭한 위치에 나타나는 원
struct TapEventCircle: View {

  private let position: CGPoint
  private let delete: () -> Void

  init(_ position: CGPoint, _ delete: @escaping () -> Void) {
    self.position = position
    self.delete = delete
  }

  var body: some View {
    Text("Tap!")
      .font(.body)
      .italic()
      .foregroundColor(.subText)
      .background(Circle()
        .fill(LinearGradient(colors: [.brand, .brand, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
        .frame(width: 80, height: 80))
      .zIndex(1)
      .position(position)
      .transition(.opacity.animation(.easeInOut))
    // 2초 후 자동으로 사라진다.
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          delete()
        }
      }
  }
}
struct TapSample_Previews: PreviewProvider {
  static var previews: some View {
    TapSample()
  }
}
