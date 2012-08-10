module Taobao
  class Model
    include Taobao::Client
    def fill_fields(obj)
      obj.each do |k,v|
        if(self.class.attr_names.include? k.to_sym)
           instance_variable_set("@#{k}",v)
        end
      end
    end
  end
end
