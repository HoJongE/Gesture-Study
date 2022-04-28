//
//  GestureCategory.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import Foundation
import SwiftUI

enum GestureCategory {
  case tap
  case drag
  case swipe
  case flick
  case pinch
  case rotate
}

extension GestureCategory {
  var categoryEnNm: String {
    switch self {
      case .tap:
        return "Tap"
      case .drag:
        return "Drag"
      case .swipe:
        return "Swipe"
      case .flick:
        return "Flick"
      case .pinch:
        return "Pinch"
      case .rotate:
        return "Rotate"
    }
  }
  var categoryKorNm: String {
    switch self {
      case .tap:
        return "탭"
      case .drag:
        return "드래그"
      case .swipe:
        return "스와이프"
      case .flick:
        return "플릭"
      case .pinch:
        return "핀치"
      case .rotate:
        return "로테이트"
    }
  }
  var gestureImage: Image {
    switch self {
      case .tap:
        return Image(systemName: "hand.tap.fill")
      case .drag:
        return Image(systemName: "hand.draw.fill")
      case .swipe:
        return Image("Swipe")
      case .flick:
        return Image("Flick")
      case .pinch:
        return Image(systemName: "arrow.up.backward.and.arrow.down.forward")
      case .rotate:
        return Image(systemName: "crop.rotate")
    }
  }
}
