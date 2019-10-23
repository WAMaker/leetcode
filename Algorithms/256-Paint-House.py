class Solution(object):
    def minCost(self, costs):
        """
        :type costs: List[List[int]]
        :rtype: int
        """
        if not len(costs):
            return 0
        res = costs[0]
        for i in range(1, len(costs)):
            cost = costs[i]
            pre = list(res)
            res[0] = min(pre[1], pre[2]) + cost[0]
            res[1] = min(pre[0], pre[2]) + cost[1]
            res[2] = min(pre[0], pre[1]) + cost[2]
            # print(res)
        return min(res)