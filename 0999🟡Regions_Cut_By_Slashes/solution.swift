class Solution {
    private struct Sector: Hashable {
        enum Location: Hashable {
            case left
            case right
            case up
            case down
        }

        let i: Int
        let j: Int
        let location: Location
    }

    func regionsBySlashes(_ grid: [String]) -> Int {
        var dsu = DSU<Sector>()

        for i in 0 ..< grid.count {
            let row = Array(grid[i])
            for j in 0 ..< row.count {
                let leftSector = Sector(i: i, j: j, location: .left)
                let rightSector = Sector(i: i, j: j, location: .right)
                let upSector = Sector(i: i, j: j, location: .up)
                let downSector = Sector(i: i, j: j, location: .down)

                switch row[j] {
                case "\\":
                    dsu.unionSets(upSector, rightSector)
                    dsu.unionSets(leftSector, downSector)
                case "/":
                    dsu.unionSets(upSector, leftSector)
                    dsu.unionSets(rightSector, downSector)
                default:
                    dsu.unionSets(leftSector, rightSector)
                    dsu.unionSets(leftSector, upSector)
                    dsu.unionSets(leftSector, downSector)
                }

                dsu.unionSets(leftSector, Sector(i: i, j: j - 1, location: .right))
                dsu.unionSets(rightSector, Sector(i: i, j: j + 1, location: .left))
                dsu.unionSets(upSector, Sector(i: i - 1, j: j, location: .down))
                dsu.unionSets(downSector, Sector(i: i + 1, j: j, location: .up))
            }
        }

        return dsu.calcSetsCount()
    }
}

// MARK: - Disjoint set union

private struct DSU<Element: Hashable> {
    private var parents: [Element: Element] = [:]
    private var ranks: [Element: Int] = [:]

    mutating func calcSetsCount() -> Int {
        var parentSet = Set<Element>()
        for (element, _) in parents {
            parentSet.insert(findSet(element))
        }
        return parentSet.count
    }

    @discardableResult
    mutating func findSet(_ v: Element) -> Element {
        guard var parent = parents[v] else {
            parents[v] = v
            return v
        }
        if parent == v {
            return v
        }

        parent = findSet(parent)
        parents[v] = parent
        return parent
    }

    mutating func unionSets(_ a: Element, _ b: Element) {
        let aS = findSet(a)
        let bS = findSet(b)
        if aS != bS {
            let minR: Element
            let maxR: Element
            if ranks[aS, default: .zero] < ranks[bS, default: .zero] {
                minR = aS
                maxR = bS
            } else {
                minR = bS
                maxR = aS
            }
            parents[minR] = maxR
            if ranks[minR] == ranks[maxR] {
                ranks[maxR, default: .zero] += 1
            }
        }
    }
}

