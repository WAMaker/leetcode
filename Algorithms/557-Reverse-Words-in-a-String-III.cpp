class Solution {
public:
	string reverseWords(string s) {
		for (int i = 0, ri = 0; i <= s.length(); i++) {
			if (i == s.length()) {
				reverse(s.begin() + ri, s.end());
				break;
			}
			if (s[i] != ' ') {
				continue;
			}
			reverse(s.begin() + ri, s.begin() + i);
			ri = i + 1;
		}
		return s;
	}
};