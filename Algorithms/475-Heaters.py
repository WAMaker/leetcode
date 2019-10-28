class Solution:
    def findRadius(self, houses: List[int], heaters: List[int]) -> int:
        houses, heaters = sorted(list(set(houses))), sorted(list(set(heaters)))
        l, r = 0, max(houses[-1], heaters[-1])
        res = r
        while l <= r:
            m = l + (r - l) // 2
            if self.bitsec(m, houses, heaters):
                r = m - 1
                res = min(res, m)
            else:
                l = m + 1
        return res
            
    def bitsec(self, radius: int, houses: List[int], heaters: List[int]) -> bool:
        i, c = 0, 0
        while i < len(houses):
            if c == len(heaters):
                return False
            house, heater = houses[i], heaters[c]
            if house + radius < heater:
                return False
            if heater + radius < house:
                c += 1
            else:
                i += 1
            
        return True