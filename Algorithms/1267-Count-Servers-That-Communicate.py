class Solution:
    def countServers(self, grid: List[List[int]]) -> int:
        res, row_map, col_map = 0, dict(), dict()

        for i, row in enumerate(grid):
            for j, server in enumerate(row):
                if not server:
                    continue
                if i in row_map:
                    row_map[i] += 1
                else:
                    row_map[i] = 1
                if j in col_map:
                    col_map[j] += 1
                else:
                    col_map[j] = 1

        for i, row in enumerate(grid):
            for j, server in enumerate(row):
                if not server:
                    continue
                if row_map[i] > 1 or col_map[j] > 1:
                    res += 1
                    
        return res