
require "minitest/autorun"
require "minitest/reporters"
require "pry"
require 'simplecov'
SimpleCov.start

Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    test_todo = @list.shift
    assert_equal(@todo1, test_todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    test_todo = @list.pop
    assert_equal(@todo3, test_todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) {@list.add(2)}
  end

  def test_shovel
    @todo4 = Todo.new('Another todo')
    @list.<< @todo4
    assert_equal([@todo1, @todo2, @todo3, @todo4], @list.to_a)
  end

  def test_add
    @todo4 = Todo.new('Another todo')
    @list.add(@todo4)
    assert_equal([@todo1, @todo2, @todo3, @todo4], @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) {@list.item_at(100)}
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) {@list.mark_done_at(100)}
    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(100)}
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
  end

  def test_done!
    @list.done!
    @list.to_a.each do |todo|
      assert_equal(true, todo.done?)
    end
  end

  def test_remove_at
    # assert_raises(IndexError) {@list.remove_at(100)}
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    # binding.pry

    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @list.mark_done_at(0)
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @list.done!
    output = <<~OUTPUT.chomp
    --- Today's Todos ---
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    title_array = []
    @list.each {|item| title_array << item.title}
    assert_equal(['Buy milk', 'Clean room', 'Go to gym'], title_array)
  end

  def test_select
    @list.done!
    test_output = @list.select {|item| item.done?}
    assert_equal(TodoList, test_output.class)
  end

end

