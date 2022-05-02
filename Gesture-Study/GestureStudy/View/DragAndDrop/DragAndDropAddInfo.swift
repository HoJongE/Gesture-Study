//
//  DragAndDropAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/02.
//

import SwiftUI

struct DragAndDropAddInfo: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading) {
        title
        Link("자세한 설명은 이곳을 참고하세요", destination: URL(string: "https://swiftui-lab.com/drag-drop-with-swiftui/")!)
          .padding(.horizontal)

        Text("SwiftUI 에선 Drag and drop 을 아주 쉽게 구현할 수 있습니다.")
          .addInfoText()
          .padding()

        Text("Drag")
          .addInfoSubTitle()
          .padding(.horizontal)

        SwiftCodeEditor("func onDrag(_ data: @escaping () -> NSItemProvider) -> some View")
          .frame(height: 45)
        Text("View 에 다음과 같은 modifier 를 적용해서 drag 가 가능하다는 것을 SwiftUI 에게 알려줍니다.")
          .addInfoText()
          .padding(.horizontal)

        Text("Drop")
          .addInfoSubTitle()
          .padding()

        SwiftCodeEditor("""
// The simplest form, let you specify a closure to execute when a view is dropped.
func onDrop(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider]) -> Bool) -> some View

// Similar to the first version, but also provides drop location information
func onDrop(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider], CGPoint) -> Bool) -> some View

// The most versatile, will let you provide a DropDelegate to handle all the operation
func onDrop(of supportedTypes: [String], delegate: DropDelegate) -> some View
""")
        .frame(height: 320)
        Text("View 에 다음과 같은 modifier 를 적용해서 drag 하는 아이템을 drop 할 수 있는 공간이라는 것을 SwiftUI 에게 알려줍니다.")
          .addInfoText()
          .padding(.horizontal)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
  }
  private var title: some View {
    HStack {
      Image(ImageName.dragAndDrop)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.brand)
        .frame(height: 30)
      Text("Drag and drop")
        .addInfoTitle()
        .fontWeight(.semibold)
    }
    .padding()
  }
}

struct DragAndDropAddInfo_Previews: PreviewProvider {
  static var previews: some View {
    DragAndDropAddInfo()
  }
}
