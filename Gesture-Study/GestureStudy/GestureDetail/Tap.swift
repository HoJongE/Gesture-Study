//
//  Tap.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import Foundation
import SwiftUI

struct Tap: GestureDetailProtocol {
  var id: UUID = UUID()

  let gestureCategory: GestureCategory = .tap

  let enNm: String = "Tap"

  let korNm: String = "탭"

  let swiftCode: String = "import SwiftUI"

  let image: Image = Image(systemName: "hand.tap.fill")

  let shortDescription: String = "단순히 화면을 한 번 터치하는 제스처입니다.\n화면을 터치해보세요!"

  let exampleView: Text = Text("하하!")

  let detailDescription: Text = Text("하하!")

  typealias ExampleView = Text

  typealias DetailDescription = Text

}
