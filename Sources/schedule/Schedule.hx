package schedule;

class Schedule {
	private var tasks: Array<Task>;
	private var currentTask: Task;
	
	public function new() {
		tasks = new Array<Task>();
		currentTask = null;
	}
	
	public function update(): Void {
		if (currentTask == null) {
			currentTask = tasks.shift();
		}
		if (currentTask != null) {
			if (currentTask.isDone()) {
				currentTask = tasks.shift();
			}
			currentTask.update();
		}
	}
}