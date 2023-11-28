class Solution {
    func numberOfWays(_ corridor: String) -> Int {
        var result = 0
        var plants = 0
        var hasPair = true
        for ch in corridor {
            if ch == "S" {
                hasPair.toggle()
                if hasPair {
                    if result == 0 {
                        result = 1
                    } else {
                        result = (result * (plants + 1)) % 1_000_000_007
                    }
                    plants = 0
                }
            } else if hasPair {
                plants += 1
            }
        }
        return hasPair ? result : 0
    }
}
