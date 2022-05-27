window.onload = function() {
  // タスクを用意
  var tasks = [
    {
    	id: 'id1',
    	name: 'タスク1',
    	description: '1つめのタスク',
    	start: '2022-05-12',
    	end: '2022-05-18',
    	progress: 100,
    },
    {
    	id: 'id2',
    	name: 'タスク2',
    	description: '2つめのタスク',
    	start: '2022-05-14',
    	end: '2022-05-18',
    	progress: 100,
    },
    {
    	id: 'id3',
    	name: 'タスク3',
    	description: '3つめのタスク',
    	start: '2022-05-17',
    	end: '2022-05-25',
    	progress: 40,
    },
    {
    	id: 'id4',
    	name: 'タスク4',
    	description: '4つめのタスク',
    	start: '2022-05-19',
    	end: '2022-05-27',
    	progress: 50,
    },
    {
    	id: 'id5',
    	name: 'タスク5',
    	description: '5つめのタスク',
    	start: '2022-05-26',
    	end: '2022-05-28',
    	progress: 20,
    },
  ];
  
  // gantt をセットアップ
  var gantt = new globalGantt("#gantt", tasks, {
    // ダブルクリック時
    on_click: (task) => {
      console.log(task.description);
    },
    // 日付変更時
    on_date_change: (task, start, end) => {
      console.log(`${task.name}: change date`);
    },
    // 進捗変更時
    on_progress_change: (task, progress) => {
      console.log(`${task.name}: change progress to ${progress}%`);
    },
  });
};
