// import "jspreadsheet-ce"
import jexcel from "jspreadsheet-ce"
import "../stylesheets/jspreadsheet"

const data = [
  ["A",1,"田中","たくま","M"],
  ["A",2,"山田","はな","F"],
  ["B",1,"細島","よしこ","F"],
  ["B",2,"安倍","まさひろ","M"]
];

window.onload = () => {
  const table = document.getElementById('mytable');
  const myTable = jexcel(table, {
      data: data,
      columns: [
        {title: '組', readOnly: true},
        {title: '番号'},
        {title: '姓'},
        {title: '名'},
        {title: '性別'}
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