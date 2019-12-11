class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        LEN = 9
        boards = [set() for i in range(LEN)]
        row, col = set(), [set() for i in range(LEN)]

        for i in range(LEN):
            row = set()
            for j in range(LEN):
                val = board[i][j]
                if val == ".":
                    continue

                if val in row:
                    return False
                row.add(val)

                if val in col[j]:
                    return False
                col[j].add(val)

                bn = (i // 3) * 3 + j // 3
                if val in boards[bn]:
                    return False
                boards[bn].add(val)

        return True