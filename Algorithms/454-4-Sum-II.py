class Solution(object):
    def fourSumCount(self, A, B, C, D):
        """
        :type A: List[int]
        :type B: List[int]
        :type C: List[int]
        :type D: List[int]
        :rtype: int
        """
        length = len(A)
        sum_m = dict()
        for i in range(length):
            for j in range(length):
                sum = A[i] + B[j]
                sum_m[sum] = sum_m.get(sum, 0) + 1

        ans = 0
        for i in range(length):
            for j in range(length):
                sum = -(C[i] + D[j])
                if sum in sum_m:
                    ans += sum_m[sum]

        return ans