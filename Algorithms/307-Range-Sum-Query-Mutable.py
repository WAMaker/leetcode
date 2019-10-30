class NumArray:

    def __init__(self, nums: List[int]):
        self.n = len(nums)
        self.cur = 0
        self.tree = [0] * (3 * len(nums) + 10)
        if self.n > 0:
            self.__build(nums, 1, self.n, 1)

    def update(self, i: int, val: int) -> None:
        self.__update(i + 1, val, 1, self.n, 1)

    def sumRange(self, i: int, j: int) -> int:
        return self.__query(i + 1, j + 1, 1, self.n, 1)
        
    def __build(self, nums: List[int], l: int, r: int, rt: int):
        if l == r:
            self.tree[rt] = nums[self.cur]
            self.cur += 1
            return
        
        m = (l + r) >> 1
        self.__build(nums, l, m, rt << 1)
        self.__build(nums, m + 1, r, rt << 1 | 1)
        
        self.__push_up(rt)
        
    def __push_up(self, rt: int):
        self.tree[rt] = self.tree[rt << 1] + self.tree[rt << 1 | 1]
        
    def __query(self, L: int, R: int, l: int, r: int, rt: int):
        if L <= l and r <= R:
            return self.tree[rt]
        
        m = (l + r) >> 1
        res = 0
        if L <= m:
            res += self.__query(L, R, l, m, rt << 1)
        if m < R:
            res += self.__query(L, R, m + 1, r, rt << 1 | 1)
        return res
    
    def __update(self, p: int, val: int, l: int, r: int, rt: int):
        if l == r:
            self.tree[rt] = val
            return
        
        m = (l + r) >> 1
        if p <= m:
            self.__update(p, val, l, m, rt << 1)
        else:
            self.__update(p, val, m + 1, r, rt << 1 | 1)
        
        self.__push_up(rt)


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# obj.update(i,val)
# param_2 = obj.sumRange(i,j)