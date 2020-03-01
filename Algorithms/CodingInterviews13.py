class Solution:
    def movingCount(self, m: int, n: int, k: int) -> int:
        # if k == 0:
        #     return 1
        visited = [[False] * n for _ in range(m)]
        visited[0][0] = True
        queue = [(0, 0)]
        res = 1
        while queue:
            i, j = queue.pop(0)
            if i > 0 and not visited[i - 1][j] and self.__can_move_to(i=i - 1, j=j, k=k):
                queue.append((i - 1, j))
                visited[i - 1][j] = True
                res += 1
            if i < m - 1 and not visited[i + 1][j] and self.__can_move_to(i=i + 1, j=j, k=k):
                queue.append((i + 1, j))
                visited[i + 1][j] = True
                res += 1
            if j > 0 and not visited[i][j - 1] and self.__can_move_to(i=i, j=j - 1, k=k):
                queue.append((i, j - 1))
                visited[i][j - 1] = True
                res += 1
            if j < n - 1 and not visited[i][j + 1] and self.__can_move_to(i=i, j=j + 1, k=k):
                queue.append((i, j + 1))
                visited[i][j + 1] = True
                res += 1
        return res

    
    def __can_move_to(self, i: int, j: int, k: int) -> bool:
        res = 0
        while i:
            res += i % 10
            i = i // 10
        while j:
            res += j % 10
            j = j // 10
        return res <= k