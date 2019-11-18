class Solution:
    def minRemoveToMakeValid(self, s: str) -> str:
        par = []
        s = list(s)
        for i in range(len(s)):
            if s[i] == '(':
                par.append(i)
            elif s[i] == ')':
                if par:
                    par.pop()
                else:
                    s[i] = ''
        for i in par:
            s[i] = '' 
        return ''.join(s)

# 二次遍历
class Solution:
    def minRemoveToMakeValid(self, s: str) -> str:
        if not s:
            return s
        
        i, c = 0, 0
        while i < len(s):
            if s[i] == '(':
                c += 1
            elif s[i] == ')' and i > 0 and c > 0:
                c -= 1
            elif s[i] == ')':
                s = s[:i] + s[i + 1:]
                i -= 1
            i += 1
				
        i, c = len(s) - 1, 0
        while i >= 0:
            if s[i] == ')':
                c += 1
            elif s[i] == '(' and i < len(s) - 1 and c > 0:
                c -= 1
            elif s[i] == '(':
                s = s[:i] + s[i + 1:]
            i -= 1
        return s