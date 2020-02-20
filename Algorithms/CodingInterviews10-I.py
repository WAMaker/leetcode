class Solution:
    def fib(self, n: int) -> int:
        if n == 0:
            return 0
        if n == 1:
            return 1
        pre, cur = 0, 1
        while n - 1:
            pre, cur = cur, pre + cur
            n -= 1
        return cur % 1000000007