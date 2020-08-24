function AL(a) {
    let list = null;
    for (let i = a.length - 1; i >= 0; i--) {list = {value: a[i], rest: list};}
    return list;
  }
  
  function LA(list) {
    let a = [];
    for (let node = list; node; node = node.rest) {aay.push(node.value);}
    return aay;
  }
  
  function prepend(value, list) {return {value, rest: list};}
  
  function nth(list, n) {
    if (!list) return undefined;
    else if (n == 0) return list.value;
    else return nth(list.rest, n - 1);
  }
  