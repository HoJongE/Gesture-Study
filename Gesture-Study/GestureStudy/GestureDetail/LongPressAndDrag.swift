//
//  Sequence.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/05.
//

import Foundation
import SwiftUI

struct LongPressAndDrag: GestureDetailProtocol {
  let gestureCategory: GestureCategory = .sequence

  let enNm: String = "Long press to drag"

  let korNm: String = "길게 눌러서 드래그하기"

  let swiftCode: String = """

"""

  var image: Image {
    Image(systemName: "hand.draw.fill")
  }

  let shortDescription: String = ""

  var exampleView: AnyView {
    AnyView(LongPressAndDragExample())
  }

  var detailDescription: AnyView {
    AnyView(LongPressAndDragAddInfo())
  }

}
