class Solution:
    # @param n, an integer
    # @return an integer
    def reverseBits(self, n):
        res, val, count = 0, 1 << 31, 1
        for i in range(32):
            if count & n:
                res = res | val
            val = val >> 1
            count = count << 1
        return res