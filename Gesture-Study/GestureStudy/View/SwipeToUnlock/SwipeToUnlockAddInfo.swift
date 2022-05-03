//
//  SwipeToUnlockAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import SwiftUI

struct SwipeToUnlockAddInfo: View {
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          title
          Text("SwiftUI 에서 따로 Swipe Gesture 를 지원해주진 않습니다. 하지만 Drag gesture 와 Drag 정보를 이용해서 직접 계산하는 방식으로 Swipe gesture 를 구현할 수 있습니다.")
            .addInfoText()
            .padding(.horizontal)
          Text("Drag gesture 의 예측 종료 지점, 예측 변경량 활용하기")
            .addInfoSubTitle()
            .padding()
          SwiftCodeEditor("""
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
  """)
          .frame(height: 340)
          Text("이번 예제에서도 Drag gesture 의 gesture value 를 활용해 Swipe gesture를 구현했습니다. 만약 코드를 보고 궁금한게 생기신다면 찾아와주세요")
            .addInfoText()
            .padding()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(Color.background)
    }

  private var title: some View {
    HStack {
      Image(ImageName.swipeToUnlock)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.brand)
        .frame(height: 30)
      Text("Swipe")
        .addInfoTitle()
        .fontWeight(.semibold)
    }
    .padding()
  }
}

struct SwipeToUnlockAddInfo_Previews: PreviewProvider {
    static var previews: some View {
        SwipeToUnlockAddInfo()
    }
}
