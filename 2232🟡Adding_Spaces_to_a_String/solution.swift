class Solution {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        var result = ""
        var ind = 0
        var spaceInd = 0
        for ch in s {
            if spaceInd < spaces.count && spaces[spaceInd] == ind {
                result.append(" ")
                spaceInd += 1
            }

            result.append(ch)
            ind += 1
        }

        return result
    }
}
