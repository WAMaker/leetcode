class TicTacToe:

    def __init__(self, n: int):
        """
        Initialize your data structure here.
        """
        self.board = [[0] * n for i in range(n)]
        self.n = n
        

    def move(self, row: int, col: int, player: int) -> int:
        """
        Player {player} makes a move at ({row}, {col}).
        @param row The row of the board.
        @param col The column of the board.
        @param player The player, can be either 1 or 2.
        @return The current winning condition, can be either:
                0: No one wins.
                1: Player 1 wins.
                2: Player 2 wins.
        """
        self.board[row][col] = player

        winner = True
        for i in range(self.n):
            if self.board[i][col] != player:
                winner = False
                break
        if winner:
            return player

        winner = True
        for i in range(self.n):
            if self.board[row][i] != player:
                winner = False
                break
        if winner:
            return player

        winner = True
        for i in range(self.n):
            if self.board[i][i] != player:
                winner = False
                break
        if winner:
            return player

        winner = True
        j = self.n - 1
        for i in range(self.n):
            if self.board[i][j] != player:
                winner = False
                break
            j = j - 1
        if winner:
            return player

        return 0
        


# Your TicTacToe object will be instantiated and called as such:
# obj = TicTacToe(n)
# param_1 = obj.move(row,col,player)