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
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 140, maximum: 200))]) {
      ForEach(GestureCategory.allCases, id: \.self) { category in
        NavigationLink(destination: GestureDetailGridView(category: category)) {
          GestureCategoryGridItemView(category: category)
        }
        .buttonStyle(PlainButtonStyle())
      }
    }
    .padding(.top, 20)
  }
}

// MARK: - Gesture Category 그리드 아이템 뷰
struct GestureCategoryGridItemView: View {

  private let gestureCategory: GestureCategory

  @Environment(\.colorScheme) private var colorScheme

  init(category gestureCategory: GestureCategory) {
    self.gestureCategory = gestureCategory
  }

  var body: some View {

    VStack(alignment: .center, spacing: 2) {
      gestureCategory.gestureImage
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 52, height: 52)
        .foregroundColor(Color.brand)
        .padding(.init(top: 34, leading: 0, bottom: 25, trailing: 0))

      Text(gestureCategory.categoryEnNm)
        .gridItemTitle()

      Text(gestureCategory.categoryKorNm)
        .gridSubTitle()
        .padding(.bottom, 10)
    }
    .lineLimit(1)
    .frame(maxWidth: 200)
    .background(RoundedRectangle(cornerRadius: 16).fill(.ultraThinMaterial).shadow(radius: 2))
    .padding(8)
  }
}
// MARK: - Gesture Category 프리뷰
struct GestureCategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    GestureCategoryGridView()
      .preferredColorScheme(.dark)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(Color.background)
  }
}
