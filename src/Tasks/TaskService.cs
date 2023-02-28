namespace Tasks;

public class TaskService
{
  private int _taskCount = 0;
  public TaskService() { }

  public Task CreateTask(string taskTitle)
  {
    if (string.IsNullOrEmpty(taskTitle))
    {
        throw new ArgumentNullException("Task Title cannot be null or empty.");
    }

    _taskCount++;

    return new Task(taskTitle);
  }

  public int TaskCount()
  {
    return _taskCount;
  }

  internal IEnumerable<Task> GetTasks()
  {
    return (new List<Task>()).AsEnumerable<Task>();
  }
}