module Tree
  class Template
    def initialize(value, children = [])
      self.value = value
      self.children = children
    end

    attr_accessor :value, :children
  end

  class TreeRealization
    def initialize(value)
      @root = Template.new(value)
      @position = @root
      @position_level = 0
    end

    def write_tree
      level_writer

      puts @root.value
      recoursive_write(@root.children)
    end

    def write_tree_from_position
      level_writer(@position_level)

      puts @position.value
      recoursive_write(@position.children)
    end

    def recoursive_write(arr, level = 0)
      arr.each do |node|
        print "#{node.value} "
      end
      level_writer(level)
      arr.each do |node|
        recoursive_write(node.children, level + 1)
      end
    end

    def level_writer(level = 0)
      puts "--------------#{level}------------"
    end

    def add_element_at_root(temp_element)
      unless temp_element.instance_of?(Tree::Template)
        raise 'Аргумент должен быть экземпляром Template класса'
      end

      @root.children << temp_element
    end


    private :recoursive_write, :level_writer
  end
end

a = Tree::TreeRealization.new(5)
# a.write_tree
g = Tree::Template.new(10)
p g.class
a.add_element_at_root(g)
a.write_tree
