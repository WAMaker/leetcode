class Solution:
    def countAndSay(self, n: int) -> str:
        res, count = '1', 1
        while count < n:
            cursor, c_count, tmp = 1, 1, ''
            while cursor < len(res):
                if res[cursor - 1] == res[cursor]:
                    c_count += 1
                else:
                    tmp += str(c_count) + res[cursor - 1]
                    c_count = 1
                cursor += 1
            tmp += str(c_count) + res[-1]
            count += 1
            res = tmp
        return res