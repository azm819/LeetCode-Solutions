class Solution {
    func isSubPath(_ head: ListNode?, _ root: TreeNode?, _ isHead: Bool = true) -> Bool {
        guard let head = head else { return true }
        guard let root = root else { return false }
        return head.val == root.val && (isSubPath(head.next, root.right, false) || isSubPath(head.next, root.left, false)) || isHead && (isSubPath(head, root.right) || isSubPath(head, root.left))
    }
}
