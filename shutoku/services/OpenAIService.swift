import Foundation

struct ChatMessage: Codable, Identifiable {
    let id: UUID
    let role: String
    let content: String

    init(role: String, content: String) {
        self.id = UUID()
        self.role = role
        self.content = content
    }
}


enum OpenAIService {

    private static let backendURL = "https://shutoku-backend-production.up.railway.app"

    private static var userID: String {
        if let existing = UserDefaults.standard.string(forKey: "shutoku_user_id") {
            return existing
        }
        let new = UUID().uuidString
        UserDefaults.standard.set(new, forKey: "shutoku_user_id")
        return new
    }

    static func send(
        messages: [ChatMessage],
        systemPrompt: String
    ) async throws -> String {
        let url = URL(string: "\(backendURL)/chat")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(userID, forHTTPHeaderField: "x-user-id")

        let body: [String: Any] = [
            "systemPrompt": systemPrompt,
            "messages": messages.map { ["role": $0.role, "content": $0.content] }
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await URLSession.shared.data(for: request)

        if let http = response as? HTTPURLResponse, http.statusCode == 429 {
            throw OpenAIError.rateLimitReached
        }

        let decoded = try JSONDecoder().decode(BackendResponse.self, from: data)
        return decoded.content
    }
}

enum OpenAIError: LocalizedError {
    case rateLimitReached
    case emptyResponse

    var errorDescription: String? {
        switch self {
        case .rateLimitReached:
            return "You've reached today's free limit. Upgrade to Shutoku Premium for unlimited access."
        case .emptyResponse:
            return "No response received."
        }
    }
}

private struct BackendResponse: Codable {
    let content: String
}
