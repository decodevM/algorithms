
import 'package:algorithms/search.dart';
import 'package:algorithms/sort.dart';

void main(){
  List list = [72,1,341,32,4,52,213,402,3442,12,345,21,23,45,623,134,56,231,11,343,2,6,878,3,1122,322];
  print('                          -------------------- Sorting ----------------                      ');
  print('Bubble:    \nBefore: $list\nAfter:  ${Sort.bubble(list)}    \n-------------------');
  print('Selection: \nBefore: $list\nAfter:  ${Sort.selection(list)} \n-------------------');
  print('Insertion: \nBefore: $list\nAfter:  ${Sort.insertion(list)} \n-------------------');
  print('Merge:     \nBefore: $list\nAfter:  ${Sort.merge(list)}     \n-------------------');
  print('Quick:     \nBefore: $list\nAfter:  ${Sort.quick(list)}     \n-------------------');
  print('Radix:     \nBefore: $list\nAfter:  ${Sort.radix(list)}     \n-------------------');

  print('                          -------------------- Linear Searching ----------------');
  print('Linear Search: \nIndex of 45 => ${LinearSearch.indexOfV2(list, 45)}'
      '\nList contain 6? => ${LinearSearch.containV2Recursion(list, 6)}');

  print('Linear Search: \nIndex of 12321 => ${LinearSearch.indexOfV2(list, 12321)}'
      '\nList contain 12321? => ${LinearSearch.containV2Recursion(list, 12321)}');

  print('                          -------------------- Binary Searching ----------------');
  list = Sort.radix(list);
  print(list);
  // Now the list is sorted
  print('Binary Search: \nIndex of 45 => ${BinarySearch.indexOf(list, 45)}'
      '\nList contain 6? => ${BinarySearch.contain(list, 6)}         \n-------------------');
  print('Binary Search: \nIndex of 12321 => ${BinarySearch.indexOf(list, 12321)}'
      '\nList contain 12321? => ${BinarySearch.contain(list, 12321)} \n-------------------');

}