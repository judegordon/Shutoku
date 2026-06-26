import Foundation

struct GrammarPoint: Identifiable {
    let id: UUID = UUID()
    let title: String
    let simplifiedRule: String
    let englishExplanation: String
    let japaneseExplanation: String
    let examples: [GrammarExample]
    let nuanceNotes: String?
    let category: GrammarCategory
}

struct GrammarExample: Identifiable {
    let id: UUID = UUID()
    let japanese: String
    let english: String
    let register: ExampleRegister?
}

enum ExampleRegister: String {
    case casual = "カジュアル"
    case polite = "丁寧"
}

enum GrammarCategory: String, CaseIterable, Identifiable {
    case abilityPossibility = "Ability & Possibility"
    case desireIntention = "Desire & Intention"
    case obligationPermission = "Obligation & Permission"
    case reasonsExplanations = "Reasons & Explanations"
    case comparisons = "Comparisons & Recommendations"
    case hearsayAppearance = "Hearsay & Appearance"
    case timeSequence = "Time & Sequence"
    case actionPatterns = "Action Patterns"
    case conditionals = "Conditionals & Consequences"
    case feelings = "Feelings & Expectations"
    case processEvaluation = "Process Evaluation"
    case formalStylistic = "Formal & Stylistic"
    case connectors = "Connectors"

    var id: String { rawValue }
}
