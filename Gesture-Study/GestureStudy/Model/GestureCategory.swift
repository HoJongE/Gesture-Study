//
//  GestureCategory.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import Foundation
import SwiftUI

enum GestureCategory: CaseIterable {
  case tap
  case drag
  case swipe
  case pinch
  case rotate
  case sequence
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
      case .pinch:
        return "Pinch"
      case .rotate:
        return "Rotate"
      case .sequence:
        return "Sequence"
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
      case .pinch:
        return "핀치"
      case .rotate:
        return "로테이트"
      case .sequence:
        return "연속 제스처"
    }
  }
  var gestureImage: Image {
    switch self {
      case .tap:
        return Image(systemName: "hand.tap.fill")
      case .drag:
        return Image(systemName: "hand.draw.fill")
      case .swipe:
        return Image(ImageName.swipe)
      case .pinch:
        return Image(systemName: "arrow.up.backward.and.arrow.down.forward")
      case .rotate:
        return Image(systemName: "crop.rotate")
      case .sequence:
        return Image(systemName: ImageName.sequence)
    }
  }
}
