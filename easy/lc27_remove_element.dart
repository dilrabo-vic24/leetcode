void main(List<String> args) {
  Solution solution = Solution();
  List<dynamic> nums = [3, 2, 2, 3];
  int val = 2;

  print(solution.removeElement(nums, val));
}

class Solution {
  int removeElement(List<dynamic> nums, int val) {
    int k = 0;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != val) {
        nums[k] = nums[i];
        k ++;
        print(nums);
      } 
    }

    return k;
  }
}
