class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var result = [String]()
        var prev = 0
        for num in target {
            let diff = num - prev
            if diff > 1 {
                for _ in 1 ..< diff {
                    result.append("Push")
                    result.append("Pop")
                }
            }
            result.append("Push")
            prev = num
        }
        return result
    }
}
