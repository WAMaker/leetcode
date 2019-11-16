class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        res = []
        def backtrack(l: int, r: int, pre: str):
            if not l and not r:
                res.append(pre)
                return
            if l:
                backtrack(l - 1, r, pre + '(')
            if l < r:
                backtrack(l, r - 1, pre + ')')
        backtrack(n, n, '')
        return res