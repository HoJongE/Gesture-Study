//
//  GestureDetailContainer.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import SwiftUI

struct GestureDetailContainer<GestureDetail: GestureDetailProtocol>: View {
  @State private var detailType: DetailType = .example
  private let gestureDetail: GestureDetail

  init(detail gestureDetail: GestureDetail) {
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
    .navigationTitle(gestureDetail.enNm)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background.edgesIgnoringSafeArea(.all))
    .toolbar(content: toolbar)
  }

  // MARK: - Gesture 의 간단한 설명 Text
  private var simpleDescription: some View {
    Text(gestureDetail.shortDescription)
      .font(.body)
      .foregroundColor(.subText)
      .padding(.init(top: 14, leading: 16, bottom: 0, trailing: 16))
  }

  // MARK: - Content
  @ViewBuilder
  private var content: some View {
    switch detailType {
      case .example:
        gestureDetail.exampleView
      case .code:
        Text(gestureDetail.swiftCode)
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

// MARK: 툴바 모음
extension GestureDetailContainer {
  @ToolbarContentBuilder
  func toolbar() -> some ToolbarContent {
    ToolbarItem(placement: .principal) {
      segmentedPicker
    }
    ToolbarItem(placement: .primaryAction) {
      addInfoBtn
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

  private var addInfoBtn: some View {
    Button {

    } label: {
      Image(systemName: "questionmark.circle")
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
