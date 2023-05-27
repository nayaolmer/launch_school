
require "pry"

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end

end



class TodoList

  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(some_Todo)
    if some_Todo.class == Todo
      @todos << some_Todo
    else
      raise TypeError, "Can only add Todo objects"
    end
    self.to_s
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? {|item| item.done?}
  end

  def item_at(some_index)
    @todos.fetch(some_index)
  end

  def mark_done_at(some_index)
    @todos.fetch(some_index).done!
  end

  def mark_undone_at(some_index)
    @todos.fetch(some_index).undone!
  end

  def done!
    @todos.each { |item| item.done!}
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(some_index)
    @todos.delete_at(some_index)
  end

  def to_s
    text = "--- #{title} ---\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    @todos.each { |item| yield item}
    self
  end

  def select
    return_list = TodoList.new(title)
    each do |todo|
      return_list << todo if yield(todo)
    end
    return_list
  end

  def find_by_title(string_to_search)
    select { |item| item.title == string_to_search}.first
  end

  def all_done
    select { |item| item.done?}
  end

  def all_not_done
    select { |item| !item.done?}
  end

  def mark_done(some_string)
    find_by_title(some_string).done!
  end

  def mark_all_done
    each {|item| item.done!}
  end

  def mark_all_undone
    each {|item| item.undone!}
  end

end

