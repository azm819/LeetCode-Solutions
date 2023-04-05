class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        guard n > 9 else { return -1 }
        var n = n
        var nArr = [Int]()
        while n > 0 {
            nArr.append(n % 10)
            n /= 10
        }
        var i = 1
        while i < nArr.count {
            if nArr[i - 1] > nArr[i] {
                break
            }
            i += 1
        }
        guard i < nArr.count else { return -1 }
        var j = 0
        var minVal = 10
        var minJ = 10
        while j < i {
            if nArr[j] > nArr[i] && nArr[j] < minVal {
                minVal = nArr[j]
                minJ = j
            }
            j += 1
        }
        nArr.swapAt(i, minJ)
        nArr = nArr.enumerated().sorted { lhs, rhs in
            switch (lhs.offset >= i, rhs.offset >= j) {
            case (true, true):
                return lhs.offset < rhs.offset
            case (true, false):
                return false
            case (false, true):
                return true
            case (false, false):
                return lhs.element > rhs.element
            }
        }.map {
            $0.element
        }
        var result: Int64 = 0
        for int in nArr.reversed() {
            result = result * 10 + Int64(int)
        }
        nArr.removeAll()
        return result > Int32.max ? -1 : Int(result)
    }
}
