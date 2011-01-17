require 'yaml'
module FileEdit
  def append_if_no_such_line(name)
    raise StandardError("not yet implemented #{self.to_yaml}")
  end

  def edit_file(filename, &block)
    instance_eval do
      block.call
    end
  end

  def line_exists?(filename, line)
    IO.read(filename).split(/\n/).include?(line)
  end

  def string_exists?(filename, string)
    IO.read(filename).match?(string)
  end

end
class Chef::Recipe
  include FileEdit
end