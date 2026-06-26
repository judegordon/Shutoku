enum ReviewGrade: Int {
    case again = 1      // もう一度 - complete miss
    case difficult = 2  // 難しい - wrong, had some memory
    case okay = 3       // 惜しい - got it, really struggled
    case good = 4       // 良い - got it comfortably
    case easy = 5       // 簡単 - instant recall
}
