class Solution {
    func sortTheStudents(_ score: [[Int]], _ k: Int) -> [[Int]] {
        score.sorted { $0[k] > $1[k] }
    }
}

