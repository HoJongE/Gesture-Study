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
    LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)], spacing: 14) {
      ForEach(GestureCategory.allCases, id: \.self) { category in
        NavigationLink(destination: GestureDetailGridView(category: .tap)) {
          GestureCategoryGridItemView(category: category)
        }
        .buttonStyle(PlainButtonStyle())
      }
    }
    .padding(.top, 20)
    .padding(.horizontal, 8)
  }
}

// MARK: - Gesture Category 그리드 아이템 뷰
struct GestureCategoryGridItemView: View {
  private let gestureCategory: GestureCategory

  init(category gestureCategory: GestureCategory) {
    self.gestureCategory = gestureCategory
  }

  var body: some View {

    VStack(alignment: .center, spacing: 2) {
      gestureCategory.gestureImage
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 52, height: 52)
        .foregroundColor(.brand)
        .padding(.init(top: 34, leading: 0, bottom: 25, trailing: 0))

      Text(gestureCategory.categoryEnNm)
        .font(.title3)
        .bold()

      Text(gestureCategory.categoryKorNm)
        .font(.caption)
        .foregroundColor(.subText)
        .padding(.bottom, 10)
    }
    .lineLimit(1)
    .frame(maxWidth: 300)
    .background(RoundedRectangle(cornerRadius: 8).fill(Color.gridItemBackground).shadow(radius: 2))
    .padding(.horizontal, 8)
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
