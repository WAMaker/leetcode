class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        stack, nmap = list(), dict()
        for i in range(len(nums2) - 1, -1, -1):
            while stack and nums2[stack[-1]] < nums2[i]:
                stack.pop()
            nmap[nums2[i]] = nums2[stack[-1]] if stack else -1
            stack.append(i)
        res = list()
        for num in nums1:
            res.append(nmap[num])
        return res