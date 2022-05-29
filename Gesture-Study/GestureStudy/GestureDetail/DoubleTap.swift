//
//  DoubleTap.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/29.
//

import Foundation
import SwiftUI

struct DoubleTap: GestureDetailProtocol {
  let framework: Framework = .SwiftUI

  let gestureCategory: GestureCategory = .tap

  let enNm: String = "Double tap"

  let korNm: String = "더블 탭"

  let swiftCode: String = """
//
//  DoubleTapExample.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/29.
//

import SwiftUI

struct DoubleTapExample: View {
  @State private var scaled: Bool = false
  var body: some View {
    VStack {
      Spacer()
      Image("SampleImage")
        .resizable()
        .aspectRatio(contentMode: .fit)
      // onTapGesture 에 카운트할 탭 수를 넣으면, 더블 탭 제스처를 구현할 수 있다.
        .onTapGesture(count: 2) {
          withAnimation(.easeInOut) {
            scaled.toggle()
          }
        }
      //scaled Bool 여부에 따라 이미지를 확대하거나 축소한다.
        .scaleEffect(scaled ? 2 : 1)
      Spacer()
    }
  }
}
"""

  var image: Image {
    Image(ImageName.doubleTap)
  }

  let shortDescription: String = "화면을 두 번 터치하는 제스처입니다.\n사진을 확대하거나 축소해보세요"

  var exampleView: AnyView {
    AnyView(DoubleTapExample())
  }

  var detailDescription: AnyView {
    AnyView(DoubleTapAddInfo())
  }

}
