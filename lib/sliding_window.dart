class SlidingWindow{
  static int maxSumIterative(List<int> list, int sumItems){
    int sum = 0;
    // check size of [list]. if size of [list] is small then [itemSum] so in this case we return 0
    if(list.length < sumItems){
      return sum;
    }

    for(int i = 0; i < list.length - sumItems; i++){
      for(int j = i; j < i + sumItems; j++){
        sum += list[j];
      }
    }
    return sum;
  }

  static int maxSum(List<int> list, int sumItems){
    int sum = 0;
    int windowSum = 0;
    // Check if size of [list] is small then [sumItem] if no so there is a problem cannot calculate the max sum
    if(list.length < sumItems){
      return sum;
    }
    // Loop to calculate the [sum] of first [sumItem] from the list
    for(int i = 0; i < sumItems; i++){
      sum += list[i];
    }
    // Now the [windowSum] is contain the sum of first [sumItem]
    windowSum = sum;

    for(int i = sumItems; i < list.length - sumItems; i++){
      windowSum -= list[i - sumItems];
      windowSum += list[i];
      sum += windowSum;
    }
    return sum;
  }
}