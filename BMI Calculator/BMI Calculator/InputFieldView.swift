//
//  InputFieldView.swift
//  BMI Calculator
//
//  Created by Aryan Jaiswal on 09/10/25.
//

import SwiftUI

struct InputFieldView: View {
    let title: String
    @Binding var text: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack(spacing: 10) {
                Image(systemName: icon)
                    .foregroundColor(.blue)

                TextField(title, text: $text)
                    .keyboardType(.decimalPad)
                    .textContentType(.none)
                    .submitLabel(.done)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.secondarySystemBackground))
            )
        }
    }
}

#Preview {
    StatefulPreviewWrapper("") { binding in
        VStack(spacing: 16) {
            InputFieldView(title: "Weight (kg)", text: binding, icon: "scalemass")
            InputFieldView(title: "Height (cm)", text: binding, icon: "ruler")
        }
        .padding()
    }
}

// A tiny helper to preview Binding values easily.
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content

    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(wrappedValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
