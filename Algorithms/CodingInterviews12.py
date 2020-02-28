class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        if not board:
            return False
        c_map = dict()
        rc, cc = len(board), len(board[0])
        if rc * cc < len(word):
            return False
        visited = [[False for _ in range(cc)] for _ in range(rc)]
        for i in range(len(board)):
            for j in range(len(board[i])):
                if board[i][j] in c_map:
                    c_map[board[i][j]].add((i, j))
                else:
                    c_map[board[i][j]] = set([(i, j)])
        
        def back_track(s: str, pi: int, pj: int) -> bool:
            if not s:
                return True
            if pi > 0 and not visited[pi - 1][pj] and s[0] == board[pi - 1][pj]:
                visited[pi - 1][pj] = True
                if back_track(s[1:], pi - 1, pj):
                    return True
                visited[pi - 1][pj] = False

            if pi < rc - 1 and not visited[pi + 1][pj] and s[0] == board[pi + 1][pj]:
                visited[pi + 1][pj] = True
                if back_track(s[1:], pi + 1, pj):
                    return True
                visited[pi + 1][pj] = False

            if pj > 0 and not visited[pi][pj - 1] and s[0] == board[pi][pj - 1]:
                visited[pi][pj - 1] = True
                if back_track(s[1:], pi, pj - 1):
                    return True
                visited[pi][pj - 1] = False

            if pj < cc - 1 and not visited[pi][pj + 1] and s[0] == board[pi][pj + 1]:
                visited[pi][pj + 1] = True
                if back_track(s[1:], pi, pj + 1):
                    return True
                visited[pi][pj + 1] = False

            return False

        if word[0] not in c_map:
            return False
        for i, j in c_map[word[0]]:
            visited[i][j] = True
            if back_track(word[1:], i, j):
                return True
            visited[i][j] = False
        return False