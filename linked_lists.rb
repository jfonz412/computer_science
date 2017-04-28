# Very little user-error checking in this code

class LinkedList
  def initialize
  	@node_count = 0
  	@head = nil
  	@tail = nil
  end

  def append(node) #adds new node to end of list
  	@tail.next = node if @tail != nil
  	@tail = node
  	node.next = nil
  	@node_count += 1
  end

  def prepend(node) #adds new node to begining of list
    if @node_count <= 1
      node.next = @tail
    else
      node.next = @head
    end
    @head = node
  	@node_count += 1
  end

  def size #returns total number of nodes in the list
  	@node_count
  end

  def head #returns first node of the list
  	@head
  end

  def tail #returns last node of the list
  	@tail
  end

  def at(index) #returns node at given index
  	return @head if index == 0

  	crawler_node = @head
  	n = index - 1

    n.times do 
      crawler_node = crawler_node.next
    end

    return crawler_node.next
  end

  def pop #removes last node from the list
    @tail = at(@node_count-2)
    @tail.next = nil
    @node_count -= 1
  end

  def contains?(value) #returns true if the passed in value is in the list (otherwise false)
  	crawler_node = @head
  	n = @node_count

    n.times do
      if crawler_node != nil
        return true if crawler_node.value == value
        crawler_node = crawler_node.next
      end
    end

    return false
  end

  def find(data) #returns the index of the node containing data or nil if not found
  	crawler_node = @head
  	n = @node_count

    n.times do
      if crawler_node != nil
        return n if crawler_node.value == data
        crawler_node = crawler_node.next
      end
    end

    return false
  end
  
  #convert objects to strings so they can be printed out:
   #(data) -> (data) -> (data) -> nil
  def to_s
    crawler_node = @head

    print @head.value + " -> "
    while crawler_node.next != nil
      print crawler_node.next.value + " -> " 
      crawler_node = crawler_node.next
    end
    print "nil"   
  end

end
class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @next = next_node
    @value = value
  end
end

linked_list = LinkedList.new

linked_list.append(Node.new("Node 3"))
linked_list.prepend(Node.new("Node 2"))
linked_list.prepend(Node.new("Node 1"))

p "size: #{linked_list.size}"
puts
p "head: #{linked_list.head.value}"
puts
p "tail: #{linked_list.tail.value}"
puts
p "At index 0: #{linked_list.at(0).value}"
p "At index 1: #{linked_list.at(1).value}"
p "At index 2: #{linked_list.at(2).value}"
puts

linked_list.pop
p "tail: #{linked_list.tail.value}"

p "At index 0: #{linked_list.at(0).value}"
p "At index 1: #{linked_list.at(1).value}"
# p "At index 2: #{linked_list.at(2).value}" results in error because it is now nil
linked_list.append(Node.new("Node 4"))
p "At index 2: #{linked_list.at(2).value}"

puts
puts "Does my linked list contain \"Node 4\"?"
p linked_list.contains?("Node 4")
puts "Data \"Node 4\" located at node#{}: #{linked_list.find("Node 4")}"

puts
linked_list.to_s
puts