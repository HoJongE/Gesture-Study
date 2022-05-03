//
//  Rotate.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/05/03.
//

import Foundation
import SwiftUI

struct Rotate: GestureDetailProtocol {

  let gestureCategory: GestureCategory = .rotate

  let enNm: String = "Rotate"

  let korNm: String = "회전"

  let swiftCode: String = """

"""

  var image: Image {
    Image(systemName: "crop.rotate")
  }

  let shortDescription: String = "Rotate gesture 는 두 손가락을 회전시키는 제스쳐입니다. 아래 아이콘을 회전시켜보세요!"

  var exampleView: AnyView {
    AnyView(RotateExample())
  }

  var detailDescription: AnyView {
    AnyView(RotateAddInfo())
  }

}
