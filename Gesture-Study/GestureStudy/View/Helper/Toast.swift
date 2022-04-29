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
  @Binding private var showToast: Bool

  init(_ text: String, show: Binding<Bool>) {
    self.text = text
    self.imageTint = nil
    self.image = nil
    self._showToast = show
  }

  init(_ text: String, icon: Image, iconTint: Color, show: Binding<Bool>) {
    self.text = text
    self.image = icon
    self.imageTint = iconTint
    self._showToast = show
  }

  func body(content: Content) -> some View {
    ZStack(alignment: .bottom) {
      content
      if showToast {
        toastMessage
          .padding(.bottom, 24)
          .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showToast = false
            }
          }
          .transition(.opacity.animation(.easeInOut))
          .zIndex(1)
      }
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
    .toast("Hello World", icon: Image(systemName: "circle.fill"), show: .constant(true))
    .padding()
    .background(LinearGradient(colors: [.brand, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
  }
}
// MARK: Toast Extension
extension View {
  func toast(_ text: String, show: Binding<Bool>) -> some View {
    modifier(Toast(text, show: show))
  }

  func toast(_ text: String, icon: Image, iconTint: Color = Color.brand, show: Binding<Bool>) -> some View {
    modifier(Toast(text, icon: icon, iconTint: iconTint, show: show))
  }
}
