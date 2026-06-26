// ReviewButtons.swift
import SwiftUI

struct ReviewButtons: View {

    let againText: String
    let difficultText: String
    let okayText: String
    let goodText: String
    let easyText: String

    let onGradeSelected: (ReviewGrade) -> Void

    var body: some View {
        HStack(spacing: 8) {
            gradeButton(
                label: "もう一度",
                subText: againText,
                grade: .again,
                color: .red
            )
            gradeButton(
                label: "難しい",
                subText: difficultText,
                grade: .difficult,
                color: .orange
            )
            gradeButton(
                label: "惜しい",
                subText: okayText,
                grade: .okay,
                color: .yellow
            )
            gradeButton(
                label: "良い",
                subText: goodText,
                grade: .good,
                color: .blue
            )
            gradeButton(
                label: "簡単",
                subText: easyText,
                grade: .easy,
                color: .green
            )
        }
    }

    private func gradeButton(
        label: String,
        subText: String,
        grade: ReviewGrade,
        color: Color
    ) -> some View {
        Button {
            onGradeSelected(grade)
        } label: {
            VStack(spacing: 4) {
                Text(label)
                    .font(.caption)
                Text(subText)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 4)
        }
        .buttonStyle(.bordered)
        .tint(color)
    }
}
