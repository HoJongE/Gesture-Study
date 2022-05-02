//
//  CustomCodeEditor.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/02.
//

import SwiftUI
import CodeEditorView

struct SwiftCodeEditor: View {
  @Environment(\.colorScheme) private var colorScheme
  private let code: String

  init(_ code: String) {
    self.code = code
  }
    var body: some View {
      CodeEditor(text: .constant(code), position: .constant(.init()), messages: .constant(.init()), language: .swift)
        .environment(\.codeEditorTheme, colorScheme == .dark ? .defaultDark : .defaultLight)
    }
}

struct CustomCodeEditor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftCodeEditor("import SwiftUI")
    }
}
