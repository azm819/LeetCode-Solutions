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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var leftH: ListNode?
        var leftT: ListNode?
        var rightH: ListNode?
        var rightT: ListNode?
        var cur = head
        while let node = cur {
            if node.val < x {
                if leftH == nil {
                    leftH = node
                } else {
                    leftT?.next = node
                }
                leftT = node
            } else {
                if rightH == nil {
                    rightH = node
                } else {
                    rightT?.next = node
                }
                rightT = node
            }
            cur = node.next
        }
        leftT?.next = rightH
        rightT?.next = nil
        return leftH != nil ? leftH : rightH
    }
}
