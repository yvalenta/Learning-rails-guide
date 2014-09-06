module Searchable
  module ClassMethods
    def search(pattern)
      where(full_statement(pattern))
    end

    def full_statement(pattern)
      statements(pattern).join(' OR ')
    end

    def statements(pattern)
      searchable_methods.map do |method|
        "#{method} LIKE '%#{pattern}%'"
      end
    end

    def searchable_methods
      attribute_names - excluded_methods
    end

    def excluded_methods
      %w{}
    end
  end

  module InstanceMethods

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end