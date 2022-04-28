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
    .preferredColorScheme(.dark)
  }

  private var contentView: some View {
    ScrollView(.vertical, showsIndicators: false) {
      GestureCategoryGridView()
    }
    .padding(.top, 20)
    .padding(.horizontal, 8)
    .navigationTitle("Gesture Category")
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background.edgesIgnoringSafeArea(.all))
    .toolbar(content: toolbar)
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

extension ContentView {
  @ToolbarContentBuilder
  func toolbar() -> some ToolbarContent {
    ToolbarItem(placement: .primaryAction) {
      higBtn
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
