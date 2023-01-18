class Solution {
    func minPartitions(_ n: String) -> Int {
        var result = 0
        for i in n {
            switch i {
                case "1": result = max(result, 1)
                case "2": result = max(result, 2)
                case "3": result = max(result, 3)
                case "4": result = max(result, 4)
                case "5": result = max(result, 5)
                case "6": result = max(result, 6)
                case "7": result = max(result, 7)
                case "8": result = max(result, 8)
                case "9": return 9
                default: break
            }
        }
        return result
    }
}
