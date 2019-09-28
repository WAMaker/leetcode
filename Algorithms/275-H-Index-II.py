class Solution:
    def hIndex(self, citations: List[int]) -> int:
        l, r = 0, len(citations)
        length = r
        ans = 0
        while l < r:
            m = l + (r - l) // 2
            h = length - m
            if h > citations[m]:
                l = m + 1
            else:
                r = m
                ans = h
        return ans