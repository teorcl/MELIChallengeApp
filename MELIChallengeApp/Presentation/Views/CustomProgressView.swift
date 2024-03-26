//
//  CustomProgressView.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 25/03/24.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        ProgressView()
            .controlSize(.extraLarge)
            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
            .padding()
            .background(Color.white.opacity(0.7))
    }
}

#Preview {
    CustomProgressView()
}
