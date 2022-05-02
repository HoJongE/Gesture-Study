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
  }

  private var contentView: some View {
    ScrollView(.vertical, showsIndicators: false) {
      GestureCategoryGridView()
    }
    .navigationTitle("Gesture Category")
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
    Button {
      print("Hello")
    } label: {
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
