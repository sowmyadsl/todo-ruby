require('rspec')
require('task')

describe(Task) do
  before() do
    Task.clear()
  end
  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new("Clean the car")
      expect(test_task.description()).to(eql("Clean the car"))
    end
  end

  describe(".all") do
    it("it is empty at first") do
      expect(Task.all()).to(eql([]))
    end
  end

  describe(".save") do
    it("it saves the task to the array") do
      test_task = Task.new("Clean the car")
      test_task.save
      expect(Task.all()).to(eql([test_task]))
    end
  end

  describe(".clear") do
    it("it clears out the saved tasks") do
      test_task = Task.new("Clean the car")
      Task.clear()
      expect(Task.all()).to(eql([]))
    end
  end
end
