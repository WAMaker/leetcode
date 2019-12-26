# list 模拟最小堆
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        intervals.sort()
        rooms, ans = [], 0

        def binsch(val: int) -> int:
            l, r = 0, len(rooms) - 1
            while l <= r:
                m = l + ((r - l) >> 1)
                if rooms[m] == val:
                    return m
                if rooms[m] < val:
                    l = m + 1
                else:
                    r = m - 1
            return l

        for i in range(len(intervals)):
            while rooms and intervals[i][0] >= rooms[0]:
                rooms.pop(0)
            idx = binsch(intervals[i][1])
            rooms.insert(idx, intervals[i][1])
            ans = max(ans, len(rooms))

        return ans

# python 最小堆 api
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        intervals.sort()
        
        rooms = []
        heapq.heappush(rooms, intervals[0][1])
        ans = 1

        for i in range(1, len(intervals)):
            while rooms and intervals[i][0] >= heapq.nsmallest(1, rooms)[0]:
                heapq.heappop(rooms)
            heapq.heappush(rooms, intervals[i][1])
            ans = max(ans, len(rooms))

        return ans