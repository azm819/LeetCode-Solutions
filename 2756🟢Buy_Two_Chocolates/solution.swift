class Solution {
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var a: Int = .max
        var b: Int = .max
        for price in prices {
            if price < a {
                b = a
                a = price
            } else if price < b {
                b = price
            }
        }
        return a + b > money ? money : money - a - b
    }
}

