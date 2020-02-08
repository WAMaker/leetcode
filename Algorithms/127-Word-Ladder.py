# BFS
class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        if endWord not in wordList or not wordList or not beginWord or not endWord:
            return 0
        word_map, queue, visited = dict(), [(beginWord, 1)], set()

        for word in wordList:
            for i in range(len(word)):
                common = word[:i] + "*" + word[i + 1:]
                if common in word_map:
                    word_map[common].append(word)
                else:
                    word_map[common] = [word]

        while queue:
            c_word, level = queue.pop(0)
            for i in range(len(c_word)):
                common = c_word[:i] + "*" + c_word[i + 1:]
                if common not in word_map:
                    continue
                for word in word_map[common]:
                    if word in visited:
                        continue
                    if word == endWord:
                        return level + 1
                    visited.add(word)
                    queue.append((word, level + 1))

        return 0


# 双向 BFS
class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        if endWord not in wordList or not wordList or not beginWord or not endWord:
            return 0
        
        word_map = dict()
        queue_begin, begin_visited = [(beginWord, 1)], {beginWord: 1}
        queue_end, end_visited = [(endWord, 1)], {endWord: 1}

        for word in wordList:
            for i in range(len(word)):
                common = word[:i] + "*" + word[i + 1:]
                if common in word_map:
                    word_map[common].append(word)
                else:
                    word_map[common] = [word]

        def word_visit(queue, visited, other_visited) -> int:
            word, level = queue.pop(0)
            for i in range(len(word)):
                common = word[:i] + "*" + word[i + 1:]
                if common not in word_map:
                    continue
                for w in word_map[common]:
                    if w in other_visited:
                        return level + other_visited[w]
                    if w in visited:
                        continue
                    visited[w] = level + 1
                    queue.append((w, level + 1))
            return 0
        
        while queue_begin and queue_end:
            ans = word_visit(queue_begin, begin_visited, end_visited)
            if ans:
                return ans
            ans = word_visit(queue_end, end_visited, begin_visited)
            if ans:
                return ans

        return 0