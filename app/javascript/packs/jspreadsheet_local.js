const data = [
  ['A',1,,'大河原','華音','F'],
  ['A',2,,'大宮','昭二','M'],
  ['A',3,,'奥村','真美','F'],
  ['A',4,,'米山','蓮','M'],
  ['A',5,,'澤田','楓香','F'],
  ['A',6,,'新倉','博','M'],
  // ['A',7,,'福山','義勝','M'],
  // ['A',8,,'宮坂','昌','M'],
  // ['A',9,,'望月','美貴子','F'],
  // ['A',10,,'吉原','千佐子','F'],
  ['B',1,,'上村','信男','M'],
  ['B',2,,'岡村','玲菜','F'],
  ['B',3,,'高見','浩之','M'],
  ['B',4,,'手塚','秀実','M'],
  ['B',5,,'畠山','知治','M'],
  ['B',6,,'花井','都','F'],
  // ['B',7,,'福井','嘉一','M'],
  // ['B',8,,'細田','菜奈','F'],
  // ['B',9,,'村岡','遥香','F'],
  // ['B',10,,'矢沢','直治','M'],
  ['C',1,,'赤井','晴花','F'],
  ['C',2,,'梅原','百合','F'],
  ['C',3,,'江田','麻央','F'],
  ['C',4,,'緒方','麻緒','F'],
  ['C',5,,'亀山','美甘','F'],
  ['C',6,,'北沢','紗希乃','F'],
  // ['C',7,,'日下部','武信','M'],
  // ['C',8,,'黒澤','常明','M'],
  // ['C',9,,'森口','俊章','M'],
  // ['C',10,,'諸星','一也','M']
];
// 表が縦に長くなりすぎるとスクロールが正しく機能しないことが判明

window.onload = () => {
  const table = document.getElementById('mytable');
  const myTable = jexcel(table, {
      data: data,
      columns: [
        {title: '旧組', width:60, readOnly: true},
        {title: '旧番号', width:60, readOnly: true},
        {title: '新組', width:60},
        {title: '姓', width:100, readOnly: true},
        {title: '名', width:100, readOnly: true},
        {title: '性別', width:50, readOnly: true}
      ],
  });
  // 行追加機能の停止
  // myTable.createRow = () => {console.log('行追加機能は停止させています')};
  // myTable.insertRow = () => {console.log('行追加機能は停止させています')};
  delete myTable.createRow;
  delete myTable.insertRow;

  // railsだと右クリック機能にエラーが出るのでひとまず停止
  // コンソールにエラーは出る／根本的な解決方法を探す必要あり
  delete myTable.contextMenu;

  // document.getElementById('data-script').remove();
  
  const submit = document.getElementById('submit');
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const sendData = myTable.getData();
    sendData.unshift(myTable.getHeaders().split(','));
    const sendJSON = JSON.stringify(sendData);

    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/annual_students", true);

    // ヘッダーからトークンを取得
    const token = document.querySelector('meta[name="csrf-token"]').content;
    XHR.setRequestHeader('X-CSRF-Token', token);
    XHR.setRequestHeader("Content-Type", "application/json");
    // XHR.responseType = "json";
    
    XHR.onload = () => {
      console.log(XHR.status);
      console.log("success!");
    };
    XHR.onerror = () => {
      console.log(XHR.status);
      console.log("error!");
    };
    XHR.send(sendJSON);
  });
};