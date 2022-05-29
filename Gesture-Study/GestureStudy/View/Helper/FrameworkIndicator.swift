//
//  FrameworkIndicator.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/29.
//

import SwiftUI

struct FrameworkIndicator: ViewModifier {
  let framework: Framework
  func body(content: Content) -> some View {
    ZStack(alignment: .topTrailing) {
      content
      makeIndicator(framework)
    }
  }
  
  private func makeIndicator(_ framework: Framework) -> some View {
    Text(framework.name)
      .font(.caption)
      .bold()
      .offset(x: -16, y: 16)
  }
}

extension View {
  func frameworkIndicator(_ framework: Framework) -> some View {
    modifier(FrameworkIndicator(framework: framework))
  }
}
#if DEBUG
struct FrameworkIndicatorPreview: PreviewProvider {
  static var previews: some View {
    GestureDetailGridItem(gestureDetail: DragAndDrop())
      .frameworkIndicator(.SwiftUI)
  }
}
#endif
