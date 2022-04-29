//
//  BottomSheetContainer.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/29.
//

import SwiftUI

struct BottomSheetContainer<Content: View>: View {

  private let content: () -> Content
  @Environment(\.dismiss) private var dismiss

  init(content: @escaping () -> Content) {
    self.content = content
  }

  var body: some View {
    VStack(alignment: .leading) {
      topView
      content()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background)
  }

  private var topView: some View {
    HStack(alignment: .center) {
      Spacer()
        .frame(maxWidth: .infinity)
      touchIndicator
        .frame(maxWidth: .infinity)
      HStack {
        Spacer()
        closeButton
      }
      .frame(maxWidth: .infinity)
    }
  }
  private var touchIndicator: some View {
    RoundedRectangle(cornerRadius: 6)
      .fill(Color.grayButton)
      .frame(width: 130, height: 5)
  }

  private var closeButton: some View {
    Button {
      dismiss()
    } label: {
      Image(systemName: "xmark.circle")
        .foregroundColor(.grayButton)
    }
    .padding()
    .contentShape(Rectangle())
    .buttonStyle(.plain)
  }
}

struct BottomSheetContainer_Previews: PreviewProvider {
  static var previews: some View {
    BottomSheetContainer {
      Text("하이")
    }
  }
}
