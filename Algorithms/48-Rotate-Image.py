class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        n = len(matrix)
        if n < 2:
            return
        lb, rb, tb, bb = 0, n - 1, 0, n - 1
        while lb < rb:
            for i in range(0, rb - lb):
                matrix[tb + i][rb], matrix[bb][rb - i], matrix[bb - i][lb], matrix[tb][i + lb] = matrix[tb][i + lb], matrix[tb + i][rb], matrix[bb][rb - i], matrix[bb - i][lb]
            
            lb += 1
            rb -= 1
            tb += 1
            bb -= 1