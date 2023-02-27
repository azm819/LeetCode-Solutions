/**
 * Definition for a QuadTree node.
 * public class Node {
 *     public var val: Bool
 *     public var isLeaf: Bool
 *     public var topLeft: Node?
 *     public var topRight: Node?
 *     public var bottomLeft: Node?
 *     public var bottomRight: Node?
 *     public init(_ val: Bool, _ isLeaf: Bool) {
 *         self.val = val
 *         self.isLeaf = isLeaf
 *         self.topLeft = nil
 *         self.topRight = nil
 *         self.bottomLeft = nil
 *         self.bottomRight = nil
 *     }
 * }
 */

class Solution {
    private func construct(
        _ grid: [[Bool]],
        _ fromI: Int,
        _ fromJ: Int,
        _ toI: Int,
        _ toJ: Int
    ) -> Node {
        // print("i: \(fromI) - \(toI)")
        // print("j: \(fromJ) - \(toJ)")
        guard fromI < toI && fromJ < toJ else {
            return Node(grid[fromI][fromJ], true)
        }
        var value: Bool?
        for i in fromI...toI {
            for j in fromJ...toJ {
                if value == nil {
                    value = grid[i][j]
                } else {
                    if value != grid[i][j] {
                        var node = Node(value!, false)
                        let c = (toI - fromI + 1) / 2
                        node.topLeft = construct(grid, fromI, fromJ, toI - c, toJ - c)
                        node.topRight = construct(grid, fromI, fromJ + c, toI - c, toJ)
                        node.bottomLeft = construct(grid, fromI + c, fromJ, toI, toJ - c)
                        node.bottomRight = construct(grid, fromI + c, fromJ + c, toI, toJ)
                        return node
                    }
                }
            }
        }
        return Node(value!, true)
    }

    func construct(_ grid: [[Int]]) -> Node? {
        construct(grid.map({ $0.map({ $0 == 1 }) }), .zero, .zero, grid.count - 1, grid.count - 1)
    }
}
