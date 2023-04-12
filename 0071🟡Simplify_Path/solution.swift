class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = [String]()
        var token = ""
        let proccessToken = {
            switch token {
            case ".":
                break
            case "..":
                stack.popLast()
            default:
                if !token.isEmpty {
                    stack.append(token)
                }
            }
            token = ""
        }
        for ch in path {
            if ch == "/" {
                proccessToken()
            } else {
                token.append(ch)
            }
        }
        proccessToken()
        return "/" + stack.joined(separator: "/")
    }
}

