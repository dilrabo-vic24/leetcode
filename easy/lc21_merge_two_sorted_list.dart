// Merge Two Sorted Lists

import 'dart:math';

void main(List<String> args) {
  Solution solution = Solution();
  List list1 = [1,2,4]; 
  List list2 = [1,3,4];

  print(solution.mergeTwoLists(list1, list2));
}


class Solution {
  List? mergeTwoLists(List? list1, List? list2) {

    List<int> listNode = [];

    int length = min(list1!.length, list2!.length);
    for(int i = 0, j = 0; i < length; i ++, j++){
      if(list1[i] > list2[i]){
      listNode.add(list2[i]);
        listNode.add(list1[i]);
      }else{
        listNode.add(list1[i]);
      listNode.add(list2[i]);
      }
    }

    return listNode;
  }
}