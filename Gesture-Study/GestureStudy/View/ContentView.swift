//
//  ContentView.swift
//  Gesture-Study
//
//  Created by JongHo Park on 2022/04/25.
//

import SwiftUI

struct ContentView: View {

  var body: some View {
    NavigationView {
      contentView
    }
    .accentColor(.brand)
  }

  private var contentView: some View {
    ScrollView(.vertical, showsIndicators: false) {
      GestureCategoryGridView()
    }
    .navigationTitle("제스처 종류")
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background.edgesIgnoringSafeArea(.all))
    .toolbar(content: toolbar)
  }
}
// MARK: - Gesture Category 툴바
extension ContentView {
  @ToolbarContentBuilder
  func toolbar() -> some ToolbarContent {
    ToolbarItem(placement: .primaryAction) {
      higBtn
    }
  }

  private var higBtn: some View {
    Link(destination: URL(string: "https://developer.apple.com/design/human-interface-guidelines/ios/user-interaction/gestures/")!) {
      Label("HIG", systemImage: "questionmark.circle")
        .labelStyle(.titleAndIcon)
        .foregroundColor(.brand)
    }
  }
}
// MARK: - 프리뷰
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
