class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var elemToInd = [Int: Int]()
        for i in 0 ..< arr2.count {
            elemToInd[arr2[i]] = i
        }

        return arr1.sorted {
            switch (elemToInd[$0], elemToInd[$1]) {
            case let (.some(lInd), .some(rInd)):
                return lInd < rInd
            case (.some, .none):
                return true
            case (.none, .some):
                return false
            case (.none, .none):
                return $0 < $1
            }
        }
    }
}

