class Solution(object):
    def guessNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        l, r = 1, n
        while l <= r:
            m = l + (r - l) // 2
            res = guess(m)
            if res == 0:
                return m
            elif res == 1:
                l = m + 1
            else:
                r = m - 1
        return l