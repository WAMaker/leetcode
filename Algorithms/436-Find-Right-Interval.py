class Solution(object):
    def findRightInterval(self, intervals):
        """
        :type intervals: List[List[int]]
        :rtype: List[int]
        """
        sorted_l = [(v[0], i) for i, v in enumerate(intervals)]
        sorted_l.sort()
        res = []
        
        for interval in intervals:
            l, r = 0, len(sorted_l)
            while l < r:
                m = l + (r - l) //2
                if sorted_l[m][0] < interval[1]:
                    l = m + 1
                else:
                    r = m
            if l >= len(intervals):
                res.append(-1)
            else:
                res.append(sorted_l[l][1])
            
        return res