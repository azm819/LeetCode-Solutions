/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var ls = lists
        var result: ListNode?
        var current: ListNode?
        while ls.contains(where: { $0 != nil }) {
            var minInd = 0
            var minValue = 100000
            ls.enumerated().forEach {
                guard let node = $0.element else { return }
                if minValue > node.val {
                    minValue = node.val
                    minInd = $0.offset
                }
            }
            if result == nil {
                result = ListNode(minValue)
                current = result
            } else {
                current?.next = ListNode(minValue)
                current = current?.next
            }
            ls[minInd] = ls[minInd]?.next
        }
        return result
    }
}
