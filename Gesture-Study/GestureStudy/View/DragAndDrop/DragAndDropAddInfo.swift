//
//  DragAndDropAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/02.
//

import SwiftUI

struct DragAndDropAddInfo: View {
  var body: some View {
    VStack(alignment: .leading) {
      title
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
        .foregroundColor(.subText)
        .font(.title2)
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
