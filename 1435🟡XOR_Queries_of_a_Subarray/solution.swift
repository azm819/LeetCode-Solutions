class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var prefixXors = Array(repeating: Int.zero, count: arr.count + 1)
        for i in 0 ..< arr.count {
            prefixXors[i + 1] = prefixXors[i] ^ arr[i]
        }

        return queries.map { query in
            prefixXors[query[0]] ^ prefixXors[query[1] + 1]
        }
    }
}
