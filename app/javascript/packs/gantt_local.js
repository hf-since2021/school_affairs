window.onload = function() {
	// const drawBtn = document.getElementById('task-draw');
	// drawBtn.onclick = () => {
		// 入力欄オブジェクトの取得
		const inputId = document.getElementById('task-id');
		const inputName = document.getElementById('task-name');
		const inputDescription = document.getElementById('task-description');
		// ボタンオブジェクトの取得
		const createBtn = document.getElementById('task-create');
		const updateBtn = document.getElementById('task-update');
		const destroyBtn = document.getElementById('task-destroy');
		const clearBtn = document.getElementById('input-clear');

		// タスクを取得
		const XHR = new XMLHttpRequest();
		XHR.open("GET", location.pathname + "/tasks", true);
		XHR.responseType = "json";
		XHR.send();
		XHR.onload = () => {
			const tasks = XHR.response
			
			// gantt をセットアップ
			const gantt = new Gantt("#gantt", tasks, {
				// ダブルクリック時
				on_click: (task) => {
					inputId.value = task.id;
					inputId.disabled = true;
					inputName.value = task.name;
					inputDescription.value = task.description;

					createBtn.disabled = true;
					updateBtn.disabled = false;
					destroyBtn.disabled = false;
					clearBtn.disabled = false;
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
			createBtn.onclick = () => {
				const tasks = gantt.tasks;
				const lastTask = tasks.slice(-1)[0];
				tasks.push({id: inputId.value, name: inputName.value, description: inputDescription.value, start: lastTask.start, end: lastTask.end, progress: 0,});
				gantt.refresh(tasks);

				inputId.value = "";
				inputName.value = "";
				inputDescription.value = "";
			};
			updateBtn.onclick = () => {
				const tasks = gantt.tasks;
				const index = tasks.map(e => e.id).indexOf(inputId.value);
				const task = tasks[index];
				task.name = inputName.value;
				task.description = inputDescription.value;
				tasks.splice(index, 1, task);
				gantt.refresh(tasks);
			};
			destroyBtn.onclick = () => {
				const tasks = gantt.tasks;
				const index = tasks.map(e => e.id).indexOf(inputId.value);
				tasks.splice(index, 1);
				gantt.refresh(tasks);

				createBtn.disabled = false;
				updateBtn.disabled = true;
				destroyBtn.disabled = true;
				clearBtn.disabled = true;

				inputId.disabled = false;
				inputId.value = "";
				inputName.value = "";
				inputDescription.value = "";
			};
			clearBtn.onclick = () => {
				createBtn.disabled = false;
				updateBtn.disabled = true;
				destroyBtn.disabled = true;
				clearBtn.disabled = true;

				inputId.disabled = false;
				inputId.value = "";
				inputName.value = "";
				inputDescription.value = "";
			};

			//「表示する」のボタンを削除
			// drawBtn.remove();
    };
	// };
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
