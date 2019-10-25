class TimeMap:

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.map = collections.defaultdict(list)

    def set(self, key: str, value: str, timestamp: int) -> None:
        self.map[key].append((value, timestamp))

    def get(self, key: str, timestamp: int) -> str:
        if key not in self.map.keys():
            return ''
        return self.__bitsec(self.map[key], timestamp)
    
    def __bitsec(self, res: List[int], timestamp: int) -> str:
        l, r = 0, len(res) - 1
        while l <= r:
            m = l + (r - l) // 2
            timestamp_pre = res[m][1]
            if timestamp_pre < timestamp:
                l = m + 1
            elif timestamp_pre == timestamp:
                return res[m][0]
            else:
                r = m - 1
        if r == -1:
            return ''
        return res[r][0]


# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap()
# obj.set(key,value,timestamp)
# param_2 = obj.get(key,timestamp)