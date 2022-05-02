//
//  GestureDetailContainer.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import SwiftUI
import CodeEditorView

// MARK: - 제스처 디테일 컨테이너
struct GestureDetailContainer: View {
  @State private var showToast: Bool = false
  @State private var detailType: DetailType = .example
  @State private var showSheet: Bool = false
  private let gestureDetail: GestureDetailProtocol

  init(detail gestureDetail: GestureDetailProtocol) {
    self.gestureDetail = gestureDetail
    UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.brand)
  }

  var body: some View {
    VStack(alignment: .leading) {
      if case DetailType.example = detailType {
        simpleDescription
      }
      content
    }
    .sheet(isPresented: $showSheet) {
      BottomSheetContainer(content: { gestureDetail.detailDescription })
    }
    .toast("클립보드 복사 완료!", icon: Image(systemName: "doc.on.clipboard.fill"), show: $showToast)
    .navigationTitle(gestureDetail.enNm)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background.edgesIgnoringSafeArea(.all))
    .toolbar(content: pickerToolbar)
  }

  // MARK: - Gesture 의 간단한 설명 Text
  private var simpleDescription: some View {
    Text(gestureDetail.shortDescription)
      .shortDescription()
      .padding(.init(top: 14, leading: 16, bottom: 0, trailing: 16))
  }

  // MARK: - Content
  @ViewBuilder
  private var content: some View {
    switch detailType {
      case .example:
        gestureDetail.exampleView
          .toolbar(content: addBtnToolbar)
      case .code:
        SwiftCodeEditor(gestureDetail.swiftCode)
          .toolbar(content: copyToolbar)
    }
  }
}
// MARK: - 설명 / 코드 enum
extension GestureDetailContainer {

  enum DetailType: String, CaseIterable {
    case example = "설명"
    case code = "코드"
  }

}

// MARK: Segmented Picker
extension GestureDetailContainer {
  @ToolbarContentBuilder
  func pickerToolbar() -> some ToolbarContent {
    ToolbarItem(placement: .principal) {
      segmentedPicker
    }
  }

  private var segmentedPicker: some View {
    Picker("DetailType", selection: $detailType) {
      ForEach(DetailType.allCases, id: \.self) {
        Text($0.rawValue)
          .padding()
          .tag($0)
          .tint(.brand)
      }
    }
    .pickerStyle(.segmented)
  }
}
// MARK: Additional Info Toolbar
extension GestureDetailContainer {
  @ToolbarContentBuilder
  func addBtnToolbar() -> some ToolbarContent {
    ToolbarItem(placement: .primaryAction) {
      additionalInfoBtn
    }
  }

  private var additionalInfoBtn: some View {
    Button {
      showSheet = true
    } label: {
      Image(systemName: "questionmark.circle")
        .foregroundColor(.brand)
    }
  }
}
// MARK: Clipboard copy Toolbar
extension GestureDetailContainer {
  @ToolbarContentBuilder
  func copyToolbar() -> some ToolbarContent {
    ToolbarItem(placement: .primaryAction) {
      copyBtn
    }
  }

  private var copyBtn: some View {
    Button {
      showToast = true
      UIPasteboard.general.string = gestureDetail.swiftCode
    } label: {
      Image(systemName: "doc.on.clipboard.fill")
        .foregroundColor(.brand)
    }
  }
}
// MARK: 프리뷰
struct GestureDetailContainer_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      GestureDetailContainer(detail: Tap())
        .preferredColorScheme(.dark)
    }
  }
}
