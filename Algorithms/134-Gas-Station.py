class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        start, tot, cos = 0, 0, 0
        for i in range(len(gas)):
            tot += gas[i] - cost[i]
            cos += gas[i] - cost[i]
            if cos < 0:
                start = i + 1
                cos = 0
        return start if tot >= 0 else -1