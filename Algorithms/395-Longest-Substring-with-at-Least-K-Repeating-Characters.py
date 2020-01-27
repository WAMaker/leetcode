class Solution:
    def longestSubstring(self, s: str, k: int) -> int:
        if len(s) < k:
            return 0
        c_map = dict()
        for c in s:
            if c in c_map:
                c_map[c] += 1
            else:
                c_map[c] = 1
        start, end = 0, len(s) - 1
        while start < end and c_map[s[start]] < k:
            start += 1
        while start < end and c_map[s[end]] < k:
            end -= 1
        print(s[start:end + 1], start, end)
        for i in range(start, end + 1):
            if c_map[s[i]] < k:
                return max(self.longestSubstring(s[i + 1:], k), self.longestSubstring(s[:i], k))
        return end - start + 1