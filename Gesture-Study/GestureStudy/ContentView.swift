//
//  ContentView.swift
//  Gesture-Study
//
//  Created by JongHo Park on 2022/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView {
        Text("Hello World")
          .navigationTitle("타이틀")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .preferredColorScheme(.dark)
    }
}
