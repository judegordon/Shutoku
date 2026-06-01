import SwiftUI

struct ReviewButtons: View {

    let hardText: String

    let okayText: String

    let goodText: String

    let easyText: String

    let onGradeSelected: (ReviewGrade) -> Void

    var body: some View {

        HStack(spacing: 12) {

            Button {

                onGradeSelected(.hard)

            } label: {

                VStack {

                    Text("Hard")

                    Text(hardText)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.bordered)

            Button {

                onGradeSelected(.okay)

            } label: {

                VStack {

                    Text("Okay")

                    Text(okayText)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.bordered)

            Button {

                onGradeSelected(.good)

            } label: {

                VStack {

                    Text("Good")

                    Text(goodText)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.bordered)

            Button {

                onGradeSelected(.easy)

            } label: {

                VStack {

                    Text("Easy")

                    Text(easyText)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}
