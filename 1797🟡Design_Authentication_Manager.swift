class AuthenticationManager {
    private var sessions = [String: Int]()
    private let timeToLive: Int

    init(_ timeToLive: Int) {
        self.timeToLive = timeToLive
    }

    func generate(_ tokenId: String, _ currentTime: Int) {
        sessions[tokenId] = currentTime
    }

    func renew(_ tokenId: String, _ currentTime: Int) {
        expireTokens(currentTime)
        if let _ = sessions[tokenId] {
            sessions[tokenId] = currentTime
        }
    }

    func countUnexpiredTokens(_ currentTime: Int) -> Int {
        expireTokens(currentTime)
        return sessions.count
    }

    private func expireTokens(_ currentTime: Int) {
        sessions = sessions.filter { (key: String, value: Int) in
            currentTime - value < timeToLive
        }
    }
}

/**
 * Your AuthenticationManager object will be instantiated and called as such:
 * let obj = AuthenticationManager(timeToLive)
 * obj.generate(tokenId, currentTime)
 * obj.renew(tokenId, currentTime)
 * let ret_3: Int = obj.countUnexpiredTokens(currentTime)
 */
