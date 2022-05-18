//
//  DragAndDropExample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/02.
//

import SwiftUI

struct DragAndDropExample: View {
  // 다크모드, 라이트 모드 정보
  @Environment(\.colorScheme) private var colorScheme
  // 이모지 배열
  private let emojis: String = "🍏🍎🍈🥐⚽️🏀🤿⛹️‍♂️🎧🎬🎤🎻🎗🚨📹💻💸🖲🎚♊️🇬🇬🆘🦐🦎🐙🐕💨🎾🥏🛥🦽🚐🏣📐"
  // 이모지 보드
  @ObservedObject private var emojiBoard: EmojiBoard = EmojiBoard()

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      ZStack {
        Color.background.edgesIgnoringSafeArea(.all).zIndex(0)
        Text("이모지를 드래그해서 여기다 넣어보세요!")
          .font(.title3)
          .fontWeight(.black)
          .foregroundColor(.brand)
        emojiView
      }
      // 유저가 드래그한 아이템이 드랍되었을 때, DropDelegate 를 구현한 타입에서 해당 처리를 대행
      .onDrop(of: [.text], delegate: EmojiDropDelegat(emojiBoard.addEmoji(_:)))
      emojiCollection
    }
  }
  // MARK: - ZStack 위에 Emoji 를 배치
  private var emojiView: some View {
    ForEach(emojiBoard.emojis) { emojiItem in
      EmojiView(emojiItem)
    }
  }
  // MARK: - 드래그할 수 있는 이모지 모음
  private var emojiCollection: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(emojis.map { String($0) }, id: \.self) { char in
          Text(char)
            .font(.largeTitle)
            // 이 뷰는 Drag 할 수 있다고 SwiftUI 에게 알림
            .onDrag {
              NSItemProvider(object: char as NSString)
            }
        }
      }
      .padding(8)
    }
    .background(colorScheme == .dark ? Color("LightBlack").edgesIgnoringSafeArea(.all).shadow(radius: 4) : Color.white.edgesIgnoringSafeArea(.all).shadow(radius: 4))

  }
}
// MARK: - 이모지 데이터를 관리하는 class
final class EmojiBoard: ObservableObject {

  @Published private (set) var emojis: [EmojiItem] = []

  struct EmojiItem: Identifiable {
    let emoji: String
    let x: CGFloat
    let y: CGFloat
    let fontSize: CGFloat
    let id: UUID = UUID()
  }
  // 새로운 emoji 를 추가
  func addEmoji(_ item: EmojiItem) {
      self.emojis.append(item)
  }
}
// MARK: - Drop perform function 을 위임하는 EmojiDropDelegate
struct EmojiDropDelegat: DropDelegate {

  private let addEmoji: (EmojiBoard.EmojiItem) -> Void

  init(_ addEmoji: @escaping (EmojiBoard.EmojiItem) -> Void) {
    self.addEmoji = addEmoji
  }

  func performDrop(info: DropInfo) -> Bool {
    // 드래그 한 아이템이 text 타입이 아니면 바로 종료
    guard info.hasItemsConforming(to: [.text]) else {
      return false
    }

    let items = info.itemProviders(for: [.text])

    for item in items {
      // 제공받은 데이터를 NSString 타입으로 변환
      item.loadObject(ofClass: NSString.self) { data, error in
        if let error = error {
          print(error)
        } else if let data = data as? NSString {
          // 제공받은 데이터가 NSString 타입이라면, addEmoji 함수 실행
          let emojiToAdd: EmojiBoard.EmojiItem = EmojiBoard.EmojiItem(emoji: String(data), x: info.location.x, y: info.location.y, fontSize: 40)
          DispatchQueue.main.async {
            addEmoji(emojiToAdd)
          }
        }
      }
    }
    return true
  }
}
// MARK: - Emoji View
struct EmojiView: View {

  private let emoji: EmojiBoard.EmojiItem
  @State private var x: CGFloat
  @State private var y: CGFloat

  init(_ emoji: EmojiBoard.EmojiItem) {
    self.emoji = emoji
    self._x = State(initialValue: emoji.x)
    self._y = State(initialValue: emoji.y)
  }

  private var dragGesture: some Gesture {
    DragGesture(minimumDistance: 0, coordinateSpace: .local)
      .onChanged { action in
        withAnimation(.interactiveSpring()) {
          x = action.location.x
          y = action.location.y
        }
      }
  }

  var body: some View {
    Text(emoji.emoji)
      .font(.system(size: emoji.fontSize))
      .position(x: x, y: y)
      .gesture(dragGesture)
  }
}
// MARK: - 프리뷰
struct DragAndDropExample_Previews: PreviewProvider {
  static var previews: some View {
    DragAndDropExample()
  }
}
