//
//  LongPressAddInfo.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/01.
//

import SwiftUI

struct LongPressAddInfo: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      title
      Text("하나 이상의 손가락을 누르고, 최소 시간 동안 손가락을 올려놓으면 동작이 트리거됩니다.")
        .addInfoText()
        .foregroundColor(.subText)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))

      Text("최소 시간")
        .addInfoSubTitle()
        .padding()
      Text("해당 최소시간만큼 손가락을 올려놓아야 동작이 트리거 됩니다.")
        .addInfoText()
        .padding(.horizontal)
      Text("최대 거리")
        .addInfoSubTitle()
        .padding()
      Text("처음 손가락을 올려놓은 지점에서 해당 거리를 벗어나면 롱 프레스가 취소됩니다.")
        .addInfoText()
        .padding(.horizontal)

    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .background(Color.background)
  }

  private var title: some View {
    HStack {
      Image(ImageName.longPress)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.brand)
        .frame(height: 30)
      Text("Long press")
        .addInfoTitle()
        .fontWeight(.semibold)
    }
    .padding()
  }
}

struct LongPressAddInfo_Previews: PreviewProvider {
  static var previews: some View {
    LongPressAddInfo()
  }
}
