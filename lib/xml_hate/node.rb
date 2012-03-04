module XmlHate
  class Node
    def initialize(hash)
      hash.each do |k,v|
        v = Node.new(v) if v.class == Hash
        self.instance_variable_set("@#{k}", v)
        self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})
        self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)}) 
      end
    end

    def method_missing(meth, *args, &blk)
      meth.to_s == meth.to_s.pluralize ? [] : ""
    end
  end
end