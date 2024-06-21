class Solution {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
        var satisfiedCustomers = 0
        for i in 0 ..< minutes where grumpy[i] == 1 {
            satisfiedCustomers += customers[i]
        }

        var maxProfit = satisfiedCustomers
        if minutes < customers.count {
            for i in minutes ..< grumpy.count {
                if grumpy[i] == 1 {
                    satisfiedCustomers += customers[i]
                }

                if grumpy[i - minutes] == 1 {
                    satisfiedCustomers -= customers[i - minutes]
                }

                maxProfit = max(maxProfit, satisfiedCustomers)
            }
        }

        for i in 0 ..< grumpy.count where grumpy[i] == 0 {
            maxProfit += customers[i]
        }

        return maxProfit
    }
}

