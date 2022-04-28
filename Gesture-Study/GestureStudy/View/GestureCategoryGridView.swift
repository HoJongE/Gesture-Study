//
//  GestureCategoryGridView.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import SwiftUI

// MARK: - Gesture Category 그리드 뷰
struct GestureCategoryGridView: View {
  var body: some View {
    VStack {
      GestureCategoryGridItemView(category: .rotate)
    }
  }
}

// MARK: - Gesture Category 그리드 아이템 뷰
struct GestureCategoryGridItemView: View {
  private let gestureCategory: GestureCategory

  init(category gestureCategory: GestureCategory) {
    self.gestureCategory = gestureCategory
  }

  var body: some View {

    VStack(spacing: 2) {
      gestureCategory.gestureImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 52, height: 52)
        .foregroundColor(.brand)
        .padding(24)

      Text(gestureCategory.categoryEnNm)
        .font(.title3)

      Text(gestureCategory.categoryKorNm)
        .font(.caption)
        .foregroundColor(.subText)
        .padding(.bottom, 8)
    }
    .lineLimit(1)
    .background(RoundedRectangle(cornerRadius: 8).fill(Color.gridItemBackground).shadow(radius: 2))

  }
}

struct GestureCategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    GestureCategoryGridView()
      .preferredColorScheme(.dark)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(Color.background)
  }
}
