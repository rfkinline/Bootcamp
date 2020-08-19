function countChar(string, ch) {
  let counted = 0;
  for (let n = 0; n < string.length; n++) {
    if (string[n] == ch) {
      counted += 1;
    }
  }
  return counted;
}

function countBs(string) {
  return countChar(string, "B");
}