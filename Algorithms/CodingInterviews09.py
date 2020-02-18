class CQueue:

    def __init__(self):
        self.stack = list()
        self.stack_re = list()
        

    def appendTail(self, value: int) -> None:
        self.stack.append(value)
        

    def deleteHead(self) -> int:
        if not self.stack:
            return -1
        while self.stack:
            self.stack_re.append(self.stack.pop())
        res = self.stack_re.pop()
        while self.stack_re:
            self.stack.append(self.stack_re.pop())
        return res


# Your CQueue object will be instantiated and called as such:
# obj = CQueue()
# obj.appendTail(value)
# param_2 = obj.deleteHead()