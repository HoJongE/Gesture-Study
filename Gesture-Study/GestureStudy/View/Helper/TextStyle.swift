//
//  TextStyle.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/02.
//

import SwiftUI

extension Text {
  func shortDescription() -> Text {
    fontWeight(.regular)
      .foregroundColor(.subText)
  }

  func gridItemTitle() -> Text {
    fontWeight(.bold)
      .font(.title3)
  }

  func gridSubTitle() -> Text {
    foregroundColor(.subText)
      .font(.caption)
  }

  func addInfoTitle() -> Text {
    fontWeight(.semibold)
      .font(.title2)
  }

  func addInfoText() -> Text {
    fontWeight(.light)
      .foregroundColor(.subText)
  }

  func addInfoSubTitle() -> Text {
    fontWeight(.semibold)
  }
}
