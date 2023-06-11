class SnapshotArray {

    private var array = [[(Int, Int)]]()
    private var snapId = 0

    init(_ length: Int) {
        array = Array(repeating: [], count: length)
    }

    func set(_ index: Int, _ val: Int) {
        if let (lastSnap, _) = array[index].last, lastSnap == snapId {
            array[index].removeLast()
        }
        array[index].append((snapId, val))
    }

    func snap() -> Int {
        defer {
            snapId += 1
        }
        return snapId
    }

    func get(_ index: Int, _ snap_id: Int) -> Int {
        guard let (lastSnap, _) = array[index].first, lastSnap <= snap_id else {
            return .zero
        }
        var l = 0
        var r = array[index].count - 1
        while l < r {
            let c = (l + r + 1) / 2
            if array[index][c].0 > snap_id {
                r = c - 1
            } else {
                l = c
            }
        }
        return array[index][l].1
    }
}

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */
