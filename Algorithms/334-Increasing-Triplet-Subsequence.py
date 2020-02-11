class Solution:
    def increasingTriplet(self, nums: List[int]) -> bool:
        top = list()
        for num in nums:
            l, r = 0, len(top)
            while l < r:
                m = l + ((r - l) >> 1)
                if top[m] == num:
                    l = m
                    break
                if top[m] > num:
                    r = m
                else:
                    l = m + 1
            if l == len(top):
                top.append(num)
            else:
                top[l] = num
        return len(top) >= 3