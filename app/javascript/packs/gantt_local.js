window.onload = function() {
	// 入力欄オブジェクトの取得
	const idInput = document.getElementById('task-id');
	const nameInput = document.getElementById('task-name');
	const descriptionInput = document.getElementById('task-description');

  // タスクを用意
  let tasks = [
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
  const gantt = new globalGantt("#gantt", tasks, {
    // ダブルクリック時
    on_click: (task) => {
      // console.log(task.id);
			// let tasks = [{id: 'id1', name: 'タスク1', description: '1つめのタスク', start: '2022-05-12', end: '2022-05-18', progress: 100,}];
			// gantt.refresh(tasks);
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
	
	// イベントを追加
	const createBtn = document.getElementById('task-create');
	createBtn.onclick = () => {
		tasks = gantt.tasks;
		lastTask = tasks.slice(-1)[0];
		tasks.push({id: idInput.value, name: nameInput.value, description: descriptionInput.value, start: lastTask.start, end: lastTask.end, progress: 0,});
		gantt.refresh(tasks);
	};
};

// Gantt("#id", tasks, {options})
	// options
		// arrow_curve: 5
		// bar_corner_radius: 3
		// bar_height: 20
		// column_width: 38
		// custom_popup_html: null
		// date_format: "YYYY-MM-DD"
		// header_height: 50
		// language: "en"
		// on_click: (task) => {…}
		// on_date_change: (task, start, end) => {…}
		// on_progress_change: (task, progress) => {…}
		// padding: 18
		// popup_trigger: "click"
		// step: 24
		// view_mode: "Day"
		// view_modes: (6) ['Quarter Day', 'Half Day', 'Day', 'Week', 'Month', 'Year']

// instance method
	// bind_bar_events: ƒ bind_bar_events()
	// bind_bar_progress: ƒ bind_bar_progress()
	// bind_events: ƒ bind_events()
	// bind_grid_click: ƒ bind_grid_click()
	// change_view_mode: ƒ change_view_mode()
	// clear: ƒ clear()
	// constructor: ƒ Gantt(wrapper, tasks, options)
	// get_all_dependent_tasks: ƒ get_all_dependent_tasks(task_id)
	// get_bar: ƒ get_bar(id)
	// get_date_info: ƒ get_date_info(date, last_date, i)
	// get_dates_to_draw: ƒ get_dates_to_draw()
	// get_oldest_starting_date: ƒ get_oldest_starting_date()
	// get_snap_position: ƒ get_snap_position(dx)
	// get_task: ƒ get_task(id)
	// hide_popup: ƒ hide_popup()
	// make_arrows: ƒ make_arrows()
	// make_bars: ƒ make_bars()
	// make_dates: ƒ make_dates()
	// make_grid: ƒ make_grid()
	// make_grid_background: ƒ make_grid_background()
	// make_grid_header: ƒ make_grid_header()
	// make_grid_highlights: ƒ make_grid_highlights()
	// make_grid_rows: ƒ make_grid_rows()
	// make_grid_ticks: ƒ make_grid_ticks()
	// map_arrows_on_bars: ƒ map_arrows_on_bars()
	// refresh: ƒ refresh(tasks)
	// render: ƒ render()
	// set_scroll_position: ƒ set_scroll_position()
	// set_width: ƒ set_width()
	// setup_date_values: ƒ setup_date_values()
	// setup_dates: ƒ setup_dates()
	// setup_dependencies: ƒ setup_dependencies()
	// setup_gantt_dates: ƒ setup_gantt_dates()
	// setup_layers: ƒ setup_layers()
	// setup_options: ƒ setup_options(options)
	// setup_tasks: ƒ setup_tasks(tasks)
	// setup_wrapper: ƒ setup_wrapper(element)
	// show_popup: ƒ show_popup(options)
	// trigger_event: ƒ trigger_event(event, args)
	// unselect_all: ƒ unselect_all()
	// update_view_scale: ƒ update_view_scale(view_mode)
	// view_is: ƒ view_is(modes)
