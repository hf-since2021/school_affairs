// import "jspreadsheet-ce"
import jexcel from "jspreadsheet-ce"
import "../stylesheets/jspreadsheet"

window.onload = () => {
  const data = [
    ["A",1,"田中","たくま","M"],
    ["A",2,"山田","はな","F"],
    ["B",1,"細島","よしこ","F"],
    ["B",2,"安倍","まさひろ","M"]
  ];
  const table = document.getElementById('mytable');
  jexcel(table, {
      data: data,
      columns: [
        {title: '学年', readOnly: true},
        {title: '組'},
        {title: '姓'},
        {title: '名'},
        {title: '性別'}
      ],
  })
}