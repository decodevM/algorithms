import 'dart:math' as math;

class Sort{
   static void _swap(List list, int i, int j){
    // Swap without using third party
    // list[i] += list[j];
    // list[j] = list[i] - list[j];
    // list[i] -= list[j];
     int tmp = list[i];
     list[i] = list[j];
     list[j] = tmp;
  }
   static List bubble(List l){
     List list = l.toList();
    int length = list.length;
    bool swapped = false;
    while(length != 1){
      for(int i = 0; i < length - 1; i++){
        if(list[i] > list[i+1]){
          swapped = true;
          _swap(list, i, i+1);
        }
      }
      if(!swapped){
        break;
      }
      length--;
    }
    return list;
  }

   static List selection(List l){
     List list = l.toList();
    int length = list.length;
    for(int i = 0; i < length - 1; i++){
      int minIndex = i;
      for(int j = i + 1; j < length; j++){
        if(list[j] < list[minIndex]){
          minIndex = j;
        }
        if(i != minIndex){
          _swap(list, i, minIndex);
        }
      }
    }
    return list;
  }

   static List insertion(List l){
     List list = l.toList();
    int length = list.length;
    for(int i = 1; i < length; i++){
      for(int j = i; j > 0; j--){
        if(list[j] < list[j-1]){
          _swap(list, j, j-1);
        }else{
          break;
        }
      }
    }
    return list;
  }

  // Merge two lists sorted
   static List _mergeList(List left, List right){
    List result = [];
    int leftIndex = 0;
    int rightIndex = 0;
    while(leftIndex < left.length && rightIndex < right.length){
      if(left[leftIndex] < right[rightIndex]){
        result.add(left[leftIndex]);
        leftIndex++;
      }else{
        result.add(right[rightIndex]);
        rightIndex++;
      }
    }

    if(leftIndex < left.length){
      result.addAll(left.sublist(leftIndex));
    }
    if(rightIndex < right.length){
      result.addAll(right.sublist(rightIndex));
    }
    return result;
  }
  
   static List merge(List l){
     List list = l.toList();
    int length = list.length;
    if(length <= 1){
      return list;
    }
    int middleIndex = length ~/ 2;
    List left = list.sublist(0, middleIndex);
    List right = list.sublist(middleIndex);
    return _mergeList(merge(left), merge(right));
  }

  // Quick Sort
   static int _pivot(List list, [int start = 0, int? end]){
    end = end ?? list.length;
    var pivot = list[start];
    int swapIndex = start;
    for(int i = start + 1; i < end; i++){
      if(list[i] < pivot){
        swapIndex++;
        // if(i == swapIndex){
        //   continue;
        // }
        _swap(list, i, swapIndex);
      }
    }
    _swap(list, start, swapIndex);
    return swapIndex;
  }

  static List quick(List l, [int start = 0, int? end]){
    List list = l.toList();
    end = end ?? list.length;
    if(start < end){
      int pivotIndex = _pivot(list, start, end);
      quick(list, start, pivotIndex);
      quick(list, pivotIndex + 1, end);
    }
    return list;
  }


  // Radix Sorting
  // Count the number of digits in number x
   static int _countDigits(int number){
    if(number == 0){
      return 1;
    }
    int log10(int x) => math.log(x.abs()) ~/ math.ln10;
    return log10(number) + 1;
  }

  // Max digits number in list
   static int _maxDigits(list){
    int max = 0;
    for(int i = 0; i < list.length; i++){
      max = math.max(max, _countDigits(list[i]));
    }
    return max;
  }

   static int _getNumberAtIndex(int number, int indexFromRight){
    return (number.abs() ~/ math.pow(10, indexFromRight)) % 10;
  }

   static List radix(List l){
     List list = l.toList();
    final int max = _maxDigits(list);
    List radixHelper(List list, [int position = 0]){
      if(position == max){
        return list;
      }
      List<List<int>> numberPackets = List.generate(10, (_) => <int>[]);
      for(int i = 0; i < list.length; i++){
        int number = _getNumberAtIndex(list[i], position);
        numberPackets[number].add(list[i]);
      }
      list = [];
      list = [...numberPackets].expand((element) => element).toList();
      return radixHelper(list, ++position);
    }
    return radixHelper(list);
  }
}