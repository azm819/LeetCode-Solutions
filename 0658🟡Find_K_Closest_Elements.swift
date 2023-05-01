class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var l = 0
        var r = arr.count - 1
        var curDist = Int.max
        var curInd = 0
        while l <= r {
            let c = (l + r) / 2
            let dist = abs(arr[c] - x)
            if dist < curDist || dist == curDist && curInd > c {
                curDist = dist
                curInd = c
            }
            if arr[c] == x {
                break
            } else if arr[c] < x {
                l = c + 1
            } else {
                r = c - 1
            }
        }
        l = curInd
        r = curInd
        while r - l + 1 < k {
            let leftD = l > .zero ? abs(arr[l - 1] - x) : .max
            let rightD = r < arr.count - 1 ? abs(arr[r + 1] - x) : .max
            if leftD > rightD {
                r += 1
            } else {
                l -= 1
            }
        }
        return Array(arr[l...r])
    }
}

