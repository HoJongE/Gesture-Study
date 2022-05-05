//
//  LongPressAndDragExample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/05.
//

import SwiftUI

struct LongPressAndDragExample: View {
  // 제스처 상태를 나타내는 메시지
  @State private var dragMessage: String = "idle"

  var body: some View {
    ZStack {
      Color.background.edgesIgnoringSafeArea(.all)
      VStack {
        Text(dragMessage)
          .font(.title2)
          .bold()
        imageToDrag
      }
        .draggable(message: $dragMessage)
    }
  }
  // 드래그할 이미지
  private var imageToDrag: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 16)
        .fill(LinearGradient(colors: [.green.opacity(0.6), .green], startPoint: .top, endPoint: .bottom))
      Image(systemName: "message.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 80)
        .foregroundColor(.white)
    }
    .frame(width: 120, height: 120)
  }
}
// MARK: - 롱 프레스 후 드래그를 가능하게 하는 View Modifier
fileprivate struct LongPressToDrag: ViewModifier {

  @Binding var message: String
  @State private var isDragging: Bool = false
  @State private var position: CGPoint = .zero

  private var longPressToDrag: some Gesture {
    LongPressGesture(minimumDuration: 0.5, maximumDistance: 200)
      .onEnded { _ in
        withAnimation(.easeInOut(duration: 0.3)) {
          message = "Drag is possible"
          isDragging = true
        }
      }
      .sequenced(before: DragGesture(minimumDistance: 0, coordinateSpace: .local)
        .onChanged { action in
          withAnimation(.interactiveSpring()) {
            message = "Dragging..."
            position = action.location
          }
        }
        .onEnded { action in
          withAnimation(.interactiveSpring()) {
            isDragging = false
            message = "idle"
            position = action.location
          }
        })
  }
  func body(content: Content) -> some View {
    GeometryReader { proxy in
      content
        .scaleEffect(isDragging ? 1.15 : 1)
        .position(position)
        .onAppear {
          position.x = proxy.size.width / 2
          position.y = proxy.size.height / 2
        }
        .gesture(longPressToDrag)
    }
  }
}
// MARK: - ViewModifier 익스텐션
extension View {
  func draggable(message: Binding<String>) -> some View {
    self
      .modifier(LongPressToDrag(message: message))
  }
}
// MARK: - 프리뷰
struct LongPressAndDragExample_Previews: PreviewProvider {
  static var previews: some View {
    LongPressAndDragExample()
  }
}
