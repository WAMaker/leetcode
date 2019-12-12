class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        if not digits:
            return []

        NM = {
            '2': ['a', 'b', 'c'],
            '3': ['d', 'e', 'f'],
            '4': ['g', 'h', 'i'],
            '5': ['j', 'k', 'l'],
            '6': ['m', 'n', 'o'],
            '7': ['p', 'q', 'r', 's'],
            '8': ['t', 'u', 'v'],
            '9': ['w', 'x', 'y', 'z']
        }

        res = list()
        def backtrace(digits, temp):
            if not digits:
                res.append(temp)
                return
            digit = digits[0]
            for i, val in enumerate(NM[digit]):
                backtrace(digits[1:], temp + val)

        backtrace(digits, '')
        return res