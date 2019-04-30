class Solution {
public:
	string reverseStr(string s, int k) {
		if (k == 1) {
			return s;
		}
		if (k >= s.length()) {
			reverse(s.begin(), s.end());
			return s;
		}
		
		int rev_i = 0, i = 0;
		for ( ; i <= s.length(); i++) {
			if (i - rev_i != k) {
				continue;
			}
			reverse(s.begin() + rev_i, s.begin() + i);
			rev_i += k << 1;
			i = rev_i;
		}
		if (i - rev_i <= k) {
			reverse(s.begin() + rev_i, s.end());
		}
		
		return s;
	}
};