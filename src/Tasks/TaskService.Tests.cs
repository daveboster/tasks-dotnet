namespace Tasks;

public class TaskServiceTests
{
    [Fact]
    public void Create_Task_WithTitle()
    {
        // Given
        var taskTitle = "Submit TPS report";
        var taskService = new TaskService();

        // When
        var task = taskService.CreateTask(taskTitle);

        // Then
        Assert.Equal(taskTitle, task.Title);
    }

    [Theory]
    [InlineData(null)]
    [InlineData("")]
    public void Create_Task_Requires_NonEmpty_Title(string taskTitle)
    {
        // Given
        var taskService = new TaskService();

        // When
        var exception = Record.Exception(() => taskService.CreateTask(taskTitle));

        // Then
        Assert.NotNull(exception);
        Assert.IsType<ArgumentNullException>(exception);
    }

    [Fact]
    public void TaskCount_EmptyList()
    {
        // Assemble
        var taskService = new TaskService();

        // Act
        int totalTasks = taskService.TaskCount();

        // Assert
        Assert.Equal(0, totalTasks);
    }

    [Theory]
    [InlineData(1)]
    [InlineData(2)]
    [InlineData(10)]
    public void TaskCount_Increments_AfterCreatingTasks(int tasksToCreate)
    {
        // Assemble
        var taskService = new TaskService();

        for(int i = 0; i < tasksToCreate; i++)
        {
            var taskTitle = $"Task {tasksToCreate}" ;
            var task = taskService.CreateTask(taskTitle);
        }

        // Act
        int totalTasks = taskService.TaskCount();

        // Assert
        Assert.Equal(tasksToCreate, totalTasks);
    }

    [Fact]
    public void GetTasks_EmptyList()
    {
        // Given
        var taskService = new TaskService();

        // When
        IEnumerable<Task> tasks = taskService.GetTasks();

        // Assert
        Assert.Empty(tasks);
    }
}