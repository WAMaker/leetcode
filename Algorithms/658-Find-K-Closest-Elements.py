# 解法一
class Solution:
    def findClosestElements(self, arr: List[int], k: int, x: int) -> List[int]:
        l, r, idx = 0, len(arr) - 1, -1
        while l <= r:
            m = l + (r - l) // 2
            if arr[m] == x:
                idx = m
            if arr[m] < x:
                l = m + 1
            else:
                r = m - 1
        if r < 0:
            r = 0
        if idx < 0:
            idx = r
            
        l = r = idx
        c = 1
        
        while c < k:
            c += 1
            if l - 1 < 0:
                r += 1
                continue
            if r + 1 >= len(arr):
                l -= 1
                continue
            if x - arr[l - 1] <= arr[r + 1] - x:
                l -= 1
            else:
                r += 1
        return arr[l:r + 1]

# 解法二
class Solution:
    def findClosestElements(self, arr: List[int], k: int, x: int) -> List[int]:
        return sorted(sorted(arr, key=lambda i: abs(i - x))[0:k])