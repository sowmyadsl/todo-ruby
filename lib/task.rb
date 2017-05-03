class Task
  # @@all_tasks = []

  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    # @@all_tasks
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch('description')
      list_id = task.fetch('list_id').to_i
      tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
    tasks
  end

  define_method(:save) do
    #  @@all_tasks.push(self)
    DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id});")
  end

  # define_singleton_method(:clear) do
  #   @@all_tasks = []
  # end

  define_method(:==) do |another_task|
    self.description.==(another_task.description).&(self.list_id.==(another_task.list_id))
  end
end
