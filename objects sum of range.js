function range(start, end, step) {
  var numbers = [];
  if(step === undefined)
  step = 1;
  if(step>0)
  for(var count=start; count<=end; count+=step) {
  numbers.push(count);
  } else
  for(var count=end; count>=start; count+=step) {
  numbers.push(count);
  }
  return numbers;
  }
  
  function sum(array) {
  if(array.length === 0)
  return 0;
  return array.pop() + sum(array);
  }