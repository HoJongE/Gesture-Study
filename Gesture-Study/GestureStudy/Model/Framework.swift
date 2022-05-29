//
//  Framework.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/29.
//

enum Framework {
  case SwiftUI
  case UIKit
}

extension Framework {
  var name: String {
    switch self {
    case .SwiftUI:
      return "SwiftUI"
    case .UIKit:
      return "UIKit"
    }
  }
}
