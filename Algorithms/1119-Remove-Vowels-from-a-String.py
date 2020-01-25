class Solution:
    def removeVowels(self, S: str) -> str:
        ans, cset = '', set(['a', 'e', 'i', 'o', 'u'])
        for c in S:
            if c in cset:
                continue
            ans += c
        return ans