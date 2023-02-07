private extension Optional where Wrapped == Int {
    var decreased: Int? {
        switch self {
        case .none:
            return nil
        case .some(let wrapped):
            return wrapped == 1 ? nil : wrapped - 1
        }
    }

    var increased: Int {
        switch self {
        case .none:
            return 1
        case .some(let wrapped):
            return wrapped + 1
        }
    }
}

class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        guard fruits.count > 2 else { return fruits.count }
        var map = [Int: Int]()
        var f = 0
        var s = 0
        var result = 0
        var num = 0
        while s < fruits.count {
            while s < fruits.count && map.count <= 2 {
                num += 1
                map[fruits[s]] = map[fruits[s]].increased
                s += 1
            }
            result = max(result, map.count <= 2 ? num : num - 1)
            while map.count > 2 {
                num -= 1
                map[fruits[f]] = map[fruits[f]].decreased
                f += 1
            }
        }
        return result
    }
}
