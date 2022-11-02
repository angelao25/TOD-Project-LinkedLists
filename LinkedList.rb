
# Class, which will represent the full list
class LinkedList

    #is_empty?: return true if the linked list is empty
    def is_empty?      
      if @head == nil
        true
      else
        false
      end
    end
    #Adds a new node containing value to the end of the list
    def append(value)
      if self.is_empty?
        @head = Node.new(value)
      else
        current_node = @head
        new_node = Node.new(value)
        while current_node.next_node != nil
          current_node = current_node.next_node
        end
        current_node.next_node = new_node
      end
    end


    #Adds a new node containing value to the start of the list
    def prepend(value)
      # If empty, add the value to the head of our new node
      if self.is_empty?
        @head = Node.new(value)
      else
        curr_head = Node.new(value)
        curr_head.next_node = @head                       
      end              
    end

    #Returns the total number of nodes in the list
    def size
      if self.is_empty?
        return "This list is empty"
      else                
        count = 0
        current_node = @head
        while current_node.next_node != nil
          current_node = current_node.next_node
          count += 1
        end
        count
      end
    end

    #Returns the first node in the list
    def head
      return @head unless self.is_empty?
    end

    #Returns the last node in the list
    def tail
      if self.is_empty?
        return "This is an empty list"
      else
        current_node = @head
        while current_node.next_node != nil
          current_node = current_node.next_node            
        end
        current_node
      end
    end

    #Returns the node at the given index   
    def at(index)
      if self.is_empty?
        return "This list looks empty."
      else
        ind = 0
        current_node = @head            
        while current_node.next_node != nil
          if ind == index
            return current_node
          end     
          current_node = current_node.next_node                    
          ind  = ind + 1
        end
                  
      end
      
    end

    #Removes the last element from the list
    def pop
      if self.is_empty?
        return "This list is currently empty"          
      else
        count = 0
        current_node = @head    
        #It will exit when it reaches the current last node, which we are popping
        while current_node.next_node != nil
        #Need to keep reference to the previous node, so we can make it point to nil afterwards
          count = count + 1
          current_node = current_node.next_node          
        end
        prev_node = at(count-1)
        prev_node.next_node = nil
      end                
    end

    #Returns true if the passed in value is in the list and otherwise returns false
    def contains?(value)
      if self.is_empty?
        return "This list is currently empty"
      #returns true if the passed in value is in the list 
      else 
        current_node = @head
        while current_node.next_node != nil
          if current_node.data == value
            return true  
          end           
          current_node = current_node.next_node                   
        end 
        return false
      end
      
    end

    #Returns the index of the node containing value, or nil if not found.
    def find(value)
      if self.is_empty?
        return "This list is currently empty"
      else
        count = 0
        current_node = @head
        while current_node.next_node != nil
          if current_node.data == value
            return count
          end
          current_node = current_node.next_node
          count = count + 1          
        end
        return nil 
      end
    end

    #Represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: (value ) -> (value ) -> (value) -> nil
    def to_s
      if self.is_empty?
        return "This list is currently empty"
      else
        new_array = []
        current_node = @head
        while current_node.next_node != nil
          new_array << ("#{current_node.data} ->")
          current_node = current_node.next_node
        end
        new_array.push('nil')
        new_array.join(' ')
      end
    end

    #Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.

    #That inserts a new node with the provided value at the given index
    def insert_at(value, index)
      if at(index - 1).nil? 
        @head = Node.new(value, at(index))
      else
        at(index - 1).next_node = Node.new(value, at(index))
      end    
    end

    #That removes the node at the given index
    def remove_at(index)
      if at(index - 1).nil?
        @head = at(index + 1)
      else
        at(index - 1).next_node = at(index + 1)
      end
    end

end

# Class, containing a #value method and a link to the #next_node, set both as nil by default

class Node
    attr_accessor :data, :next_node

    def initialize(data = nil, next_node = nil)
        @data = data
        @next_node = next_node
    end 

end


list1 = LinkedList.new
# empty = list1.is_empty?
#puts empty
list1.append(15)
# list.pretty_print
#empty = list.is_empty?
#puts empty
list1.append(10)
list1.append(4)
list1.append(16)
# list1.prepend(0)

list1.remove_at(0)

p list1.insert_at(55, 2)