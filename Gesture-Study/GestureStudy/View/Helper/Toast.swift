//
//  Toast.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/29.
//

import SwiftUI

// MARK: - Toast Modifier
struct Toast: ViewModifier {

  private let image: Image?
  private let text: String
  private let imageTint: Color?

  init(_ text: String) {
    self.text = text
    self.imageTint = nil
    self.image = nil
  }

  init(_ text: String, icon: Image, iconTint: Color) {
    self.text = text
    self.image = icon
    self.imageTint = iconTint
  }

  func body(content: Content) -> some View {
    ZStack(alignment: .bottom) {
      content
      toastMessage
        .padding(.bottom, 24)
    }
  }

  private var toastMessage: some View {
    HStack {
      image?.foregroundColor(imageTint)
      Text(text)
        .foregroundColor(.subText)
        .font(.caption)
        .fontWeight(.semibold)
    }
    .padding(12)
    .background(GlassBackground())
    .cornerRadius(10)
    .overlay(overlayView)
  }

  private var overlayView: some View {
    RoundedRectangle(cornerRadius: 10)
      .strokeBorder(LinearGradient(colors: [Color.white.opacity(0.3), Color.white.opacity(0), Color.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)

  }
}
// MARK: GlassBackground
struct GlassBackground: View {
  var body: some View {
    Rectangle()
      .fill(Color.clear)
      .background(.ultraThinMaterial)
  }
}

struct Toast_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Text("Hello World")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .toast("Hello World", icon: Image(systemName: "circle.fill"))
    .padding()
    .background(LinearGradient(colors: [.brand, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
  }
}
// MARK: Toast Extension
extension View {
  func toast(_ text: String) -> some View {
    modifier(Toast(text))
  }

  func toast(_ text: String, icon: Image, iconTint: Color = Color.brand) -> some View {
    modifier(Toast(text, icon: icon, iconTint: iconTint))
  }
}
