//
//  GestureDetailGridView.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import SwiftUI

// MARK: 제스처 디테일 그리드뷰
struct GestureDetailGridView: View {

  private let category: GestureCategory
  private let gestureDetails: [GestureDetailProtocol]
  init(category gestureCategory: GestureCategory) {
    self.category = gestureCategory
    self.gestureDetails = gestureDetailCollections.filter {
      gestureCategory == $0.gestureCategory
    }
  }

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      gridView
    }
    .navigationTitle(category.categoryEnNm)
    .background(Color.background.edgesIgnoringSafeArea(.all))
  }

  private var gridView: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 140, maximum: 200))]) {
      ForEach(gestureDetails, id: \.korNm) { detail in
        NavigationLink(destination: GestureDetailContainer(detail: detail)) {
          GestureDetailGridItem(gestureDetail: detail)
        }
        .buttonStyle(.plain)
      }
    }
    .padding(.top, 20)
  }
}
// MARK: 제스처 디테일 그리드 아이템
struct GestureDetailGridItem: View {
  @Environment(\.colorScheme) private var colorScheme
  let gestureDetail: GestureDetailProtocol

  var body: some View {
    VStack(alignment: .center, spacing: 2) {
      gestureDetail.image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 52, height: 52)
        .foregroundColor(Color.brand)
        .padding(.init(top: 34, leading: 0, bottom: 25, trailing: 0))

      Text(gestureDetail.enNm)
        .gridItemTitle()

      Text(gestureDetail.korNm)
        .gridSubTitle()
        .padding(.bottom, 10)
    }
    .lineLimit(1)
    .frame(maxWidth: 300)
    .background(RoundedRectangle(cornerRadius: 16).fill(.ultraThinMaterial).shadow(radius: 2))
    .padding(8)
  }
}
// MARK: 제스처 디테일 프리뷰
struct GestureDetailGridView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      GestureDetailGridView(category: .tap)
        .preferredColorScheme(.dark)
    }
  }
}
