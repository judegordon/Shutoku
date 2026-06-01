import SwiftUI

struct SessionCompleteView: View {

    let onReturnHome: () -> Void

    var body: some View {

        VStack(spacing: 32) {

            Spacer()

            VStack(spacing: 12) {

                Text("Done for now")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("No cards remaining")
                    .foregroundColor(.gray)
            }

            Button("Return Home") {

                onReturnHome()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}
