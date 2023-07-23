class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        word.allSatisfy(\.isLowercase) || word.allSatisfy(\.isUppercase) || word == word.capitalized
    }
}
