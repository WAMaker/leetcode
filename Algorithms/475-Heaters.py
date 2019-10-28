class Solution:
    def findRadius(self, houses: List[int], heaters: List[int]) -> int:
        houses, heaters = sorted(list(set(houses))), sorted(list(set(heaters)))
        cur, res = 0, 0
        for house in houses:
            dis = abs(house - heaters[cur])
            while cur + 1 < len(heaters) and dis > abs(house - heaters[cur + 1]):
                cur += 1
                dis = abs(house - heaters[cur])
            res = max(res, dis)
        return res