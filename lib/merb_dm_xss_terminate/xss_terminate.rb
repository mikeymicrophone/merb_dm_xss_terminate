module XssTerminate
  def self.included(base)
    base.extend(ClassMethods)#::ModelMethods)
    # sets up default of stripping tags for all fields
    # base.send(:xss_terminate)
  end

  module ClassMethods
    # module ModelMethods
      def xss_terminate(options = {})
        before :save, :sanitize_fields

        write_inheritable_attribute(:xss_terminate_options, {
          :disable => (options[:disable] || false),
          :except => (options[:except] || []),
          :html5lib_sanitize => (options[:html5lib_sanitize] || []),
          :sanitize => (options[:sanitize] || [])
        })
        
        class_inheritable_reader :xss_terminate_options

        include XssTerminate::InstanceMethods
      end
    # end
    # 
    # def self.extended(base)
    #   base.extend(ModelMethods)
    #   base.send(:xss_terminate)  
    # end
  end
  
  module InstanceMethods
        
    def sanitize_fields
      self.class.properties.each do |column|
        next unless (column.type == :string || column.type == :text)
        
        field = column.name.to_sym
        value = self[field]
        
        if xss_terminate_options[:disable] || xss_terminate_options[:except].include?(field)
          next
        elsif xss_terminate_options[:html5lib_sanitize].include?(field)
          self[field] = HTML5libSanitize.new.sanitize_html(value)
        elsif xss_terminate_options[:sanitize].include?(field)
          self[field] = RailsSanitize.white_list_sanitizer.sanitize(value)
        else
          self[field] = RailsSanitize.full_sanitizer.sanitize(value)
        end
      end
    end
  end
end

#you can either mix-into DataMapper::Model if the behavior is global to every single Model (Resource class), or if it needs to be mixed into each model separately, you can use DataMapper::Model.append_extensions XssTerminate::ClassMethods::ModelMethods
#dkubb: schwabsauce: how append_extensions works is when the class includes DataMapper::Resource, whatever is queued up with append_extensions will extend the class' methods