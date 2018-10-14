# circular queue with room for 3 objects
# write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with  an argument provided to CircularQueue::new, and should provide the following methods:

# `#enqueue` to add an object to the queue
# `#dequeue` to remove (and return) the oldest object im the queue. It should return `nil` if the queue is empty.

#algorithm:
# - initialize a circular que to the size of Max_buffer_size by filling an array with that many `nil`'s
# - we need a counter to move through the buffer and add or remove elements. This will be `location_counter` and each time we increment the buffer, the location counter will be incremented
# - - we need to reset this counter to 0 when we reach the max buffer_size - 1



class CircularQueue
  attr_accessor :buffer, :max_buffer_size

  def initialize(max_buffer_size)
    @location_counter = 0
    @max_buffer_size = max_buffer_size
    @buffer = []
    max_buffer_size.times { @buffer << nil }
  end

  def enqueue(element)
    if
      buffer[@location_counter] = element
    elsif

    end

    if @location_counter < (max_buffer_size - 1)
      @location_counter += 1
    else
      @location_counter = 0
    end
  end

  def dequeue
  end
end
