function reverseArray(initialArray){
  var newArray = [];
  var lastElement = initialArray[initialArray.length - 1];
    for (counter = initialArray.length - 1; counter>=0; counter--){
        toReverse = initialArray[counter];
        newArray.push(" " + toReverse);
     };
}
  
  function reverseArrayInPlace(alwaysArray){
    var numberOfItems = alwaysArray.length;
    for (counter = 0 ; counter<= ( numberOfItems-1 ) ; counter ++){
         var lastItem = alwaysArray[numberOfItems-1];
         alwaysArray.splice (counter, 0, lastItem);
         alwaysArray.pop()
      };
}
  