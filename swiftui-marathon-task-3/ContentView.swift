//
//  ContentView.swift
//  swiftui-marathon-task-3
//

import SwiftUI

struct ContentView: View {
	@State var isPressed = false

	var body: some View {
		Button(action: {
			isPressed.toggle()
		}) {
			AnimatableButtonLabel(isPressed: self.$isPressed)
		}
		.buttonStyle(PlainButtonStyle())
	}
}

struct AnimatableButtonLabel: View {
	@Binding var isPressed: Bool

	var body: some View {
		HStack(spacing: 0) {
			Image(systemName: "play.fill")
				.id(self.isPressed)
				.transition(.asymmetric(insertion: .scale, removal: .slide.combined(with: .opacity)))
				.animation(.bouncy, value: self.isPressed)

			Image(systemName: "play.fill")
				.id(self.isPressed)
				.transition(.asymmetric(insertion: .slide.combined(with: .opacity), removal: .scale))
				.animation(.bouncy, value: self.isPressed)
				.offset(x: -2)
		}
		.foregroundStyle(Color.blue)
		.scaleEffect(2)
	}
}

#Preview {
    ContentView()
}
