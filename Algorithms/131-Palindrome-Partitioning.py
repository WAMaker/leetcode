class Solution:
    def partition(self, s: str) -> List[List[str]]:
        res = list()
        def dfs(s: str, paths: List[str]):
            if not s:
                res.append(paths)
                return
            for i in range(len(s)):
                if s[:i + 1] == s[i::-1]:
                    dfs(s[i + 1:], paths + [s[:i + 1]])
        dfs(s, [])
        return res