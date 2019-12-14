class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        memo = dict()

        def dp(i: int, j: int) -> int:
            if i == -1:
                return j + 1
            if j == -1:
                return i + 1
            if (i, j) in memo:
                return memo[(i, j)]
            if word1[i] == word2[j]:
                return dp(i - 1, j - 1)
            
            memo[(i, j)] = min(dp(i - 1, j), dp(i, j - 1), dp(i - 1, j - 1)) + 1
            return memo[(i, j)]

        return dp(len(word1) - 1, len(word2) - 1)