module XssTerminate
  def self.included(base)
    base.extend(ClassMethods)
    # sets up default of stripping tags for all fields
    # base.send(:xss_terminate)
  end

  module ClassMethods
    module ModelMethods
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
    end
    def self.included(base)
      base.extend ModelMethods
      base.send(:xss_terminate)
    end
  end
  
  module InstanceMethods
        
    def sanitize_fields
      self.class.columns.each do |column|
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
  
  DataMapper::Resource.append_inclusions XssTerminate
  DataMapper::Model.append_extensions XssTerminate::ClassMethods
end
