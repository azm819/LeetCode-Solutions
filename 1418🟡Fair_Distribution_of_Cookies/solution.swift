class Solution {
    private func dfs(
        _ ind: Int,
        _ distribution: [Int],
        _ cookies: [Int]
    ) -> Int {
        guard ind < cookies.count else { return distribution.max() ?? .max }
        var resDist: Int = .max

        for i in 0..<distribution.count {
            var subRes = distribution
            subRes[i] += cookies[ind]
            let dist = dfs(ind + 1, subRes, cookies)
            if dist < resDist {
                resDist = dist
            }
        }

        return resDist
    }

    func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
        dfs(.zero, Array(repeating: 0, count: k), cookies)
    }
}
