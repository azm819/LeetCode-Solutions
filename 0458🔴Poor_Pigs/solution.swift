class Solution {
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        let rounds = minutesToTest / minutesToDie
        let base = rounds + 1
        var result = 0
        var maxBuckets = 1
        while maxBuckets < buckets {
            maxBuckets *= base
            result += 1
        }
        return result
    }
}
