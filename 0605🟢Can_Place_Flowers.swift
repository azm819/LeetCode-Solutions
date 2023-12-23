class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var wasZero = true
        var result = 0
        for i in 0 ..< flowerbed.count {
            if flowerbed[i] == 0 {
                if wasZero && (i == flowerbed.count - 1 || flowerbed[i + 1] == 0) {
                    result += 1
                    wasZero = false
                } else {
                    wasZero = true
                }
            } else {
                wasZero = false
            }
        }
        return result >= n
    }
}
