class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        i, j = 0, 0
        ls, lt = len(s), len(t)
        while i < ls and j < lt:
            if s[i] == t[j]:
                i += 1
            j += 1
        return i == ls