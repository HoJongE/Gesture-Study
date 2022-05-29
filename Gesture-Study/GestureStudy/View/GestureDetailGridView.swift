//
//  GestureDetailGridView.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import SwiftUI

// MARK: 제스처 디테일 그리드뷰

enum FrameworkSelection: CaseIterable {
  case all
  case swiftUI
  case uikit
  
  var name: String {
    switch self {
    case .all:
      return "All"
    case .swiftUI:
      return "SwiftUI"
    case .uikit:
      return "UIKit"
    }
  }
}
struct GestureDetailGridView: View {
  @State private var currentFramework: FrameworkSelection = .all
  private let category: GestureCategory
  
  init(category gestureCategory: GestureCategory) {
    self.category = gestureCategory
  }
  
  var body: some View {
    let gestureDetails: [GestureDetailProtocol] = gestureDetailCollections.filter {
      category == $0.gestureCategory
    }.filter {
      switch currentFramework {
      case .all:
        return true
      case .swiftUI:
        return $0.framework == .SwiftUI
      case .uikit:
        return $0.framework == .UIKit
      }
    }
    ScrollView(.vertical, showsIndicators: false) {
      gridView(gestures: gestureDetails)
    }
    .safeAreaInset(edge: .bottom, content: {
      FrameworkSelector(selection: $currentFramework)
    })
    .navigationTitle(category.categoryEnNm)
    .background(Color.background.edgesIgnoringSafeArea(.all))
  }
  
  private func gridView(gestures: [GestureDetailProtocol]) -> some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 140, maximum: 200))]) {
      ForEach(gestures, id: \.korNm) { detail in
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
    .frameworkIndicator(gestureDetail.framework)
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
// MARK: - Framework Selector
struct FrameworkSelector: View {
  @Binding var selection: FrameworkSelection
  var body: some View {
    ZStack {
      indicator
        .mask {
          Rectangle()
            .cornerRadius(20, corners: .topLeft)
            .cornerRadius(20, corners: .topRight)
            .frame(width: UIScreen.main.bounds.width, alignment: .center)
            .ignoresSafeArea()
        }
      buttons
    }
    .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
    .background(Rectangle().fill(.regularMaterial).cornerRadius(20, corners: .topLeft).cornerRadius(20, corners: .topRight).ignoresSafeArea().shadow(radius: 2))
  }
  
  private var indicator: some View {
    Rectangle()
      .fill(Color.brand)
      .frame(width: UIScreen.main.bounds.width/3)
      .ignoresSafeArea()
      .offset(x: offset(by: selection))
  }
  
  private var buttons: some View {
    HStack(alignment: .center) {
      ForEach(FrameworkSelection.allCases, id: \.self) { selection in
        Button(action: {
          changeSelection(selection)
        }) {
          Text(selection.name)
            .bold()
            .frame(maxWidth: .infinity)
            .foregroundColor(self.selection == selection ? .white : .primary)
        }
      }
    }
    .buttonStyle(.plain)
  }
  
  private func changeSelection(_ selection: FrameworkSelection) {
    withAnimation(.spring()) {
      self.selection = selection
    }
  }
  
  private func offset(by selection: FrameworkSelection) -> CGFloat {
    switch selection {
    case .all:
      return -UIScreen.main.bounds.width/3
    case .swiftUI:
      return 0
    case .uikit:
      return UIScreen.main.bounds.width/3
    }
  }
}
