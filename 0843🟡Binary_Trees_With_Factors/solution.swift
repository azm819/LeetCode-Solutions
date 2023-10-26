class Solution {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        var dict = [Int: Int]()
        var sum = 0
        for num in arr.sorted() {
            var result = 1
            for (ch1, count1) in dict where num % ch1 == .zero {
                if let count2 = dict[num / ch1] {
                    let subRes = (count1 * count2) % 1_000_000_007
                    result = (result + subRes) % 1_000_000_007
                }
            }
            sum = (sum + result) % 1_000_000_007
            dict[num] = result
        }
        return sum
    }
}

