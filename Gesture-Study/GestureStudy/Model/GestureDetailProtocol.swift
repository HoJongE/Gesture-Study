//
//  GestureDetailProtocol.swift
//  GestureStudy
//
//  Created by JongHo Park on 2022/04/28.
//

import Foundation
import SwiftUI

protocol GestureDetailProtocol: Identifiable {

  associatedtype ExampleView: View
  associatedtype DetailDescription: View

  var gestureCategory: GestureCategory { get }
  var enNm: String { get }
  var korNm: String { get }
  var swiftCode: String { get }
  var image: Image { get }
  var shortDescription: String { get }
  var exampleView: ExampleView { get }
  var detailDescription: DetailDescription { get }

}
