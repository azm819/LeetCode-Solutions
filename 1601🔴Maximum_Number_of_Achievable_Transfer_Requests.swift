class Solution {
    private func dfs(
        _ cur: Int,
        _ reqCount: Int,
        _ requests: [[Int]],
        _ resResidents: [Int],
        _ curResidents: [Int]
    ) -> Int {
        guard cur < requests.count else { return resResidents == curResidents ? reqCount : 0 }
        var result = dfs(cur + 1, reqCount, requests, resResidents, curResidents)
        var newResidents = curResidents
        newResidents[requests[cur][0]] -= 1
        newResidents[requests[cur][1]] += 1
        result = max(result, dfs(cur + 1, reqCount + 1, requests, resResidents, newResidents))
        return result
    }

    func maximumRequests(_ n: Int, _ requests: [[Int]]) -> Int {
        var residents = Array(repeating: 0, count: n)
        for request in requests {
            residents[request[0]] += 1
        }
        return dfs(.zero, .zero, requests, residents, residents)
    }
}
