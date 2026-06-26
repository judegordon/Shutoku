import SwiftUI

struct TranslationSessionView: View {
    let mode: TranslationMode

    @State private var messages: [ChatMessage] = []
    @State private var input: String = ""
    @State private var isLoading: Bool = false
    @State private var errorMessage: String? = nil
    @FocusState private var inputFocused: Bool

    private var systemPrompt: String {
        switch mode {
        case .japaneseToEnglish:
            return """
            You are a Japanese to English translation tutor. 
            First ask the user for their estimated JLPT level (N5 being beginner, N1 being advanced).
            Then give them a Japanese sentence to translate to English. 
            The sentence should be reasonably long but not more than two lines.
            Topics should be incredibly varied — nature, food, relationships, work, travel, history, technology, etc.
            After they attempt a translation, go through the key grammar points, vocabulary, and other aspects of the sentence. Confirm what they got right and clearly explain what was unclear or incorrect.
            Automatically adjust the difficulty of subsequent sentences based on how well they are doing.
            Continue giving new sentences after each round of feedback.
            """
        case .englishToJapanese:
            return """
            You are an English to Japanese translation tutor.
            First ask the user for their estimated JLPT level (N5 being beginner, N1 being advanced).
            Then give them an English sentence to translate to Japanese.
            The sentence should be reasonably long but not more than two lines.
            Topics should be incredibly varied — nature, food, relationships, work, travel, history, technology, etc.
            After they attempt a translation, go through the key grammar points, vocabulary, and other aspects of the sentence. Confirm what they got right and clearly explain what was unclear or incorrect.
            Automatically adjust the difficulty of subsequent sentences based on how well they are doing.
            Continue giving new sentences after each round of feedback.
            """
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                        if isLoading {
                            HStack {
                                ProgressView()
                                    .padding()
                                    .background(.regularMaterial)
                                    .cornerRadius(12)
                                Spacer()
                            }
                        }
                        if let error = errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.caption)
                                .padding()
                        }
                    }
                    .padding()
                }
                .onChange(of: messages.count) {
                    if let last = messages.last {
                        withAnimation {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
            }

            Divider()

            HStack(spacing: 12) {
                TextField("Type here...", text: $input, axis: .vertical)
                    .padding(10)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($inputFocused)
                    .lineLimit(1...4)

                Button {
                    send()
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 32))
                }
                .disabled(input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isLoading)
            }
            .padding()
        }
        .navigationTitle(mode.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { startSession() }
    }

    private func startSession() {
        Task {
            isLoading = true
            errorMessage = nil
            do {
                let response = try await OpenAIService.send(
                    messages: [],
                    systemPrompt: systemPrompt
                )
                messages.append(ChatMessage(role: "assistant", content: response))
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }

    private func send() {
        let text = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        input = ""
        messages.append(ChatMessage(role: "user", content: text))

        Task {
            isLoading = true
            errorMessage = nil
            do {
                let response = try await OpenAIService.send(
                    messages: messages,
                    systemPrompt: systemPrompt
                )
                messages.append(ChatMessage(role: "assistant", content: response))
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}

struct MessageBubble: View {
    let message: ChatMessage

    var isUser: Bool { message.role == "user" }

    var body: some View {
        HStack {
            if isUser { Spacer() }
            Text(message.content)
                .padding(12)
                .background(isUser ? Color.blue : Color(.systemGray6))
                .foregroundColor(isUser ? .white : .primary)
                .cornerRadius(16)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.75, alignment: isUser ? .trailing : .leading)
            if !isUser { Spacer() }
        }
    }
}
