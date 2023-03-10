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
    private let root: ListNode?
    private var length: Int?

    init(_ head: ListNode?) {
        root = head
    }

    func getRandom() -> Int {
        choose(.random(in: 0..<(length ?? 10000)))
    }

    private func choose(_ num: Int) -> Int {
        var left = num
        var node = root
        while left > .zero {
            left -= 1
            node = node?.next
            if node == nil {
                length = num - left
                return choose(num % length!)
            }
        }
        return node!.val
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */
