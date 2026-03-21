require_relative 'linkedlist/linkedlist'
require_relative 'linkedlist/node'

list = LinkedList::LinkedList.new
list.append('Pete')
list.append('Pam')
list.append('Pasha')
list.append('Paul')
puts list
puts "Size of list = #{list.size}"

list = LinkedList::LinkedList.new
list.prepend('Pete')
list.prepend('Pam')
list.prepend('Pasha')
list.prepend('Paul')
puts list
puts "Size of list = #{list.size}"

list.insert_at(2, %w[Scott Sam])
puts list
puts "Size of list = #{list.size}"

list.remove_at(3)
puts list
puts "Size of list = #{list.size}"

puts list.index('Pasha')
puts list.index('Sue')

puts list.at(4)
