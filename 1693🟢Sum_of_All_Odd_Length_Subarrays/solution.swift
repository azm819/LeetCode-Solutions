class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        let n = arr.count - 1
        var result = 0
        for i in 0...n {
            let leftEven = i / 2
            let leftOdd = i - leftEven
            let rightElems = n - i
            let rightEven = rightElems / 2
            let rightOdd = rightElems - rightEven
            result += arr[i] * ((leftEven + 1) * (rightEven + 1) + leftOdd * rightOdd)
        }
        return result
    }
}
