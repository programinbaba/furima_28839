function fee() {

  // DOM取得(HTMLのどの要素かを判別)
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  console.log(addTaxPrice.value)
  
  // 計算し、textContentでHTMLを解釈せずにそのまま文字として出力
  const calculate = itemPrice.value * 0.1
  addTaxPrice.textContent = calculate
  profit.textContent = itemPrice.value - calculate
}

// ページ(window)の要素に値が入力されたとき(input)にfee関数が実行
window.addEventListener("input", fee)