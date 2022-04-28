//
//  Tap.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import Foundation
import SwiftUI

struct Tap: GestureDetailProtocol {
  let gestureCategory: GestureCategory = .tap

  let enNm: String = "Tap"

  let korNm: String = "탭"

  let swiftCode: String = ""

  let image: Image = Image(systemName: "hand.tap.fill")

  let shortDescription: String = "탭임"

  let exampleView: Text = Text("하하!")

  let detailDescription: Text = Text("하하!")

  typealias ExampleView = Text

  typealias DetailDescription = Text

}
