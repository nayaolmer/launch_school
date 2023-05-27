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

  attr_accessor :items, :list_title, :due_date

  def initialize(list_title = '')
    @items = []
    @list_title = list_title
    @due_date = ''
  end


  def <<(todo_item)
    # if todo_item.class == Todo
    #   items << todo_item
    # else
    #   raise TypeError "Can only add Todo objects"
    # end
    raise TypeError, 'can only add Todo objects' unless todo_item.instance_of? Todo

    items << todo_item
  end

  alias_method :add, :<<

  def size
    items.length
  end

  def first
    items[0]
  end

  def last
    items[-1]
  end

  def to_a
    items.clone
  end

  def done?
    items.all? {|item| item.done?}
  end

  def item_at(idx)
    items.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    items.each { |item| item.done!}
  end

  def shift
    items.shift
  end

  def pop
    items.pop
  end

  def remove_at(idx)
    items.delete_at(idx)
  end


  def to_s
    text =  "---- #{list_title} ----\n"
    text << items.map(&:to_s).join("\n")
    text
  end

  def each
    items.each do |item|
      yield(item)
    end
    self
  end

  def select
    output_list = TodoList.new()
    each do |item|
      output_list << item if yield(item)
    end
    output_list
  end

  def find_by_title(some_title)
    select {|todo| todo.title == some_title}.first
  end

  def all_done
    select {|todo| todo.done?}
  end

  def all_not_done
    select {|todo| !todo.done?}
  end

  def mark_done(some_title)
    find_by_title(some_title).done!
  end

  def mark_all_done
    each do |item|
      item.done!
    end
  end

  def mark_all_undone
    each do |item|
      item.undone!
    end
  end

end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

# puts list
# p list.find_by_title('Go to gym')
# list.mark_done('Go to gym')
list.mark_all_done
puts list
