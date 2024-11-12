class Solution {
    func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
        let sortedItems: [(price: Int, beauty: Int)] = items
            .map { (price: $0[0], beauty: $0[1]) }
            .sorted { $0.price < $1.price || $0.price == $1.price && $0.beauty < $1.beauty }
        var maxBeautyValues = [Int]()
        var curMaxBeauty: Int = .zero
        for item in sortedItems {
            curMaxBeauty = max(curMaxBeauty, item.beauty)
            maxBeautyValues.append(curMaxBeauty)
        }

        return queries.map { query in
            guard query >= sortedItems[0].price else {
                return .zero
            }

            var l = 0
            var r = sortedItems.count - 1
            while l < r {
                let m = (l + r + 1) / 2
                if sortedItems[m].price > query {
                    r = m - 1
                } else {
                    l = m
                }
            }

            return maxBeautyValues[l]
        }
    }
}

