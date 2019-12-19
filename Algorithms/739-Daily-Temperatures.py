class Solution:
    def dailyTemperatures(self, T: List[int]) -> List[int]:
        stack, ans = list(), [0] * len(T)
        for i in range(len(T) - 1, -1, -1):
            while stack and stack[-1][0] <= T[i]:
                stack.pop()
            ans[i] = stack[-1][1] - i if len(stack) else 0
            stack.append((T[i], i))
        return ans