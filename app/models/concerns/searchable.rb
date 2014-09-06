module Searchable
  extend ActiveSupport::Concern


  module ClassMethods
    def search
      where(full_statement(pattern))
    end

    def full_statement(pattern)
      statements(pattern).join( ' OR ' )
    end

    def statements(pattern)
      searchable_methods.map do |method|
        "#{method} like '%#{pattern}%'"
      end
    end

    def searchable_methods
      %w{}
    end

  end
end