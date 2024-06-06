class Solution {
    func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count % k == .zero else {
            return false
        }

        var counts = [Int: Int]()
        for card in nums {
            counts[card, default: .zero] += 1
        }

        for int in counts.keys.sorted() {
            while counts[int]! > .zero {
                var nextInt = int
                while nextInt - int < k {
                    guard let count = counts[nextInt], count > .zero else {
                        return false
                    }

                    counts[nextInt] = count - 1
                    nextInt += 1
                }
            }
        }

        return true
    }
}

