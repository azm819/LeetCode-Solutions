class StockSpanner {
    private var stack = [(price: Int, days: Int)]()

    func next(_ price: Int) -> Int {
        var days = 1
        while let (prevPrice, prevDays) = stack.last, prevPrice <= price {
            stack.removeLast()
            days += prevDays
        }
        stack.append((price, days))
        return days
    }
}


/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
