class Solution {
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        var result = 0
        let garbageTypes: [Character] = ["M", "P", "G"]
        for garbageType in garbageTypes {
            var curDist = 0
            for i in 0 ..< garbage.count {
                let count = garbage[i].filter { $0 == garbageType }.count
                if count > .zero {
                    result += count
                    result += curDist
                    curDist = 0
                }
                if i < travel.count {
                    curDist += travel[i]
                }
            }
        }
        return result
    }
}
