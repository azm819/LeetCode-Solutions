class SmallestInfiniteSet {
    private var smallest: Int = 1
    private var returned = Set<Int>()

    func popSmallest() -> Int {
        if let smallestReturned = returned.min(), smallestReturned < smallest {
            return returned.remove(smallestReturned)!
        } else {
            defer {
                smallest += 1
            }
            return smallest
        }
    }

    func addBack(_ num: Int) {
        guard num < smallest else { return }
        returned.insert(num)
    }
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * let obj = SmallestInfiniteSet()
 * let ret_1: Int = obj.popSmallest()
 * obj.addBack(num)
 */
