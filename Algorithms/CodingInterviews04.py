class Solution:
    def findNumberIn2DArray(self, matrix: List[List[int]], target: int) -> bool:
        if not matrix or not matrix[0]:
            return False

        row, col = 0, len(matrix[0]) - 1
        while row < len(matrix) and col > -1:
            num = matrix[row][col]
            if num == target:
                return True
            elif num > target:
                col -= 1
            else:
                row += 1

        return False