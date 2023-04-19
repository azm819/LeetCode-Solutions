class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var l = 0
        var r = letters.count - 1
        while l < r {
            let c = (l + r) / 2
            if letters[c] <= target {
                l = c + 1
            } else {
                r = c
            }
        }
        return letters[r] > target ? letters[r] : letters[0]
    }
}
