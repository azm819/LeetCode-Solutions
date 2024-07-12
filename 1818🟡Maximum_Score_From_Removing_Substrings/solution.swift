class Solution {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        var letter1: Character
        var letter2: Character
        var points: Int
        if x > y {
            letter1 = "a"
            letter2 = "b"
            points = x
        } else {
            letter1 = "b"
            letter2 = "a"
            points = y
        }

        var result: Int = .zero
        var queue1 = [Character]()
        for ch in s {
            if ch == letter2, queue1.last == letter1 {
                queue1.removeLast()
                result += points
            } else {
                queue1.append(ch)
            }
        }

        swap(&letter1, &letter2)
        points = min(x, y)
        var queue2 = [Character]()
        for ch in queue1 {
            if ch == letter2, queue2.last == letter1 {
                queue2.removeLast()
                result += points
            } else {
                queue2.append(ch)
            }
        }

        return result
    }
}
