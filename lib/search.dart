class LinearSearch{
  //---------------- Index of Element in List ----------------//

  /*
    This function iterate n times to verify if the [item] is exist in the list
    If the item found in any index we will stop the operation in this index and return the index
  */
  static int indexOfV1(List l, var item){
    List list = l.toList();
    for(int i = 0; i < list.length; i++){
      if(list[i] == item){
        return i;
      }
    }
    // The [item] not found in the list
    return -1;
  }

  /*
     This function compare the left and the right side in the same iteration with the [item]
     So in this case we don't need to iterate [n] times to verify [n] item
     but we will iterate [n/2] times to verify [n] item
  */
  static int indexOfV2(List l, var item){
    List list = l.toList();
    int length = list.length;
    for(int i = 0; i < length / 2; i++){
      // Verify the left side
      if(list[i] == item){
        return i;
      }
      // Verify the right side
      if(list[length - i - 1] == item){
        return length - i - 1;
      }
    }
    // The [item] not found in the list
    return -1;
  }


  //---------------- List [Contain] Element ----------------//
  /*
      This Function verify if the [list] contain [item]
      BigO of this function is n
      In the bad case we need to verify all item => n times
      Version iterative => using for loop
  */
  static bool containV1(List l, var item){
    List list = l.toList();
    int length = list.length;
    for(int i = 0; i < length; i++){
      if(list[i] == item){
        return true;
      }
    }
    return false;
  }

  /*
    This function has the same usage like [containV1]
    But in this time we using the recursion not the iterative concept
  */
  static bool containV1Recursion(List l, var item){
    List list = l.toList();
    // Check length of list => stop condition
    if(list.isEmpty){
      return false;
    }
    // Check the fist element if is equal to the [item] then return true
    if(list.first == item){
      return true;
    }
    // The first item not equal to the [item] the we need to delete it
    list.removeAt(0);
    // Check again with the new version of the list
    return containV1Recursion(list, item);
  }


  /*
      This function is the same concept like [containV1]
      But the bigO is n/2 because in the same iterative we check the left and right element
  */
  static bool containV2(List l, var item){
    List list = l.toList();
    int length = list.length;
    for(int i = 0; i < length / 2; i++){
      if(list[i] == item || list[length - i - 1] == item){
        return true;
      }
    }
    // We are check all the list and the [item] not exist
    return false;
  }

  /*
      This function has the same concept like [containV1Recursion]
      But in the same time we check the first and last item and if we found the [item] we return true
      else we remove the first and the last item and check again with the new version of list
  */
  static bool containV2Recursion(List l, var item){
    List list = l.toList();
    // Check length of list => stop condition
    if(list.isEmpty){
      return false;
    }
    // Check if the first or the last is equal the [item] then return true
    if(list.first == item || list.last == item){
      return true;
    }
    // The first or last not equal to the [item] => we need to remove both (first, last)
    list.removeAt(0);
    list.removeLast();
    // Check again with the new version of list
    return containV2Recursion(list, item);
  }
}


class BinarySearch{

  /*
    Binary Search algorithm used to increase search operation in List
    but the List must be sorted to apply this algorithm

    Functionality:
    We need to know if the specific item is exist in the list to return true or the location of this item (index)
    the algorithm split the list into two part and check the middle element if:
      - is equal to the [item] => return true or the location or do something
      - smaller then the [item] => use the algorithm with the new list which is the right part of the old list
      - bigger then the [item] => use the algorithm with the new list which is the left part of the old list
    To solve this problem we can use the iterative or the recursion methode.
    But the professional way to solve this problem is to use the recursion methode.
  */


  static bool contain(List l, var item){
    List list = l.toList();
    // We suppose that the list is already sorted

    // Check the list if contain just one element and compare it with [item] => if != then return false
    int length = list.length;
    if(length == 1 && list.first != item){
      return false;
    }
    // Get the index of the middle element to compare with our [item]
    int middleIndex = length ~/ 2;
    var middle = list[middleIndex];
    // Check if the middle element is equal to our [item] => then return true
    if(middle == item){
      return true;
    }
    // Check if the middle element is small then our [item] => our new list is the right part of old list
    if(middle < item){
      // Get right part of old list
      list = list.sublist(middleIndex);
    }else{
      // Here the middle element is bigger then our [item] => our new list is the left part of the old list
      // Get the left part of the old list
      list = list.sublist(0, middleIndex);
    }
    // Restart the algorithm with the new list
    return contain(list, item);
  }


  static int indexOf(List l, var item){
    List list = l.toList();
    int leftIndex = 0;
    int rightIndex = list.length;
    while(rightIndex - leftIndex != 1){
      int middleIndex = (rightIndex + leftIndex) ~/ 2;
      if(list[middleIndex] == item){
        return middleIndex;
      }
      if(list[middleIndex] < item) {
        leftIndex = middleIndex;
      }else{
        rightIndex = middleIndex;
      }

    }
    if(list[leftIndex] == item){
      return leftIndex;
    }
    return -1;
  }
}