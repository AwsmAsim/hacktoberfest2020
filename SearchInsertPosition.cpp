/*
Statement: https://leetcode.com/problems/search-insert-position/
*/

class Solution {
public:
    int searchInsert(vector<int>& nums, int target) {
        vector<int>::iterator itr;
        itr = lower_bound(nums.begin(),nums.end(),target);   // find location of same elemnt or elemnt just greater than given element
        // if(*itr == target) return (itr-nums.begin());
        return (itr-nums.begin());
    }
};
