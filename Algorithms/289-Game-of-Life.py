class Solution:
    def gameOfLife(self, board: List[List[int]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        if not len(board):
            return
        rc, cc = len(board), len(board[0])

        def reset(i: int, j: int):
            l, r = max(0, j - 1), min(cc - 1, j + 1)
            t, b = max(0, i - 1), min(rc - 1, i + 1)
            tot = 0

            for _i in range(t, b + 1):
                for _j in range(l, r + 1):
                    if _i == i and _j == j:
                        continue
                    if board[_i][_j] == 1 or board[_i][_j] == -1:
                        tot += 1

            if board[i][j] == 1:
                if tot < 2 or tot > 3:
                    board[i][j] = -1
                return
            if tot == 3:
                board[i][j] = -2

        for i in range(rc):
            for j in range(cc):
                reset(i, j)
        
        for i, row in enumerate(board):
            for j, val in enumerate(row):
                if val == -2:
                    board[i][j] = 1
                elif val == -1:
                    board[i][j] = 0