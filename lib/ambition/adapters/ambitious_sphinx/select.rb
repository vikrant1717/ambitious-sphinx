##
# The format of the documentation herein is:
#
# >> method with block
# => methods on this class called by Ambition (with arguments)
#
module Ambition
  module Adapters
    module AmbitiousSphinx
      class Select < Base
        # >> select { |u| u.name == 'chris' } 
        # => #call(:name)
        def call(method)
          "#{method.to_s}:"
        end

        # >> select { |u| u.name.downcase == 'chris' } 
        # => #call(:name, :downcase)
        def chained_call(*methods)
          # An idiom here is to call the chained method and pass it
          # the first method.
          #
          #   if respond_to? methods[1]
          #     send(methods[1], methods[0])
          #   end
          #
          # In the above example, this translates to calling:
          #
          #   #downcase(:name)
          #
          raise "Not implemented yet."
        end

        # &&
        # >> select { |u| u.name == 'chris' && u.age == 22 }
        # => #both( processed left side, processed right side )
        def both(left, right)
          left = 
          "#{left} AND #{right}"
        end

        # ||
        # >> select { |u| u.name == 'chris' || u.age == 22 }
        # => #either( processed left side, processed right side )
        def either(left, right)
          "#{left} OR #{right}"
        end

        # >> select { |u| u.name == 'chris' }
        # => #==( call(:name), 'chris' )
        def ==(left, right)
          raise "Not applicable to sphinx."
        end

        # !=
        # >> select { |u| u.name != 'chris' }
        # => #not_equal( call(:name), 'chris' )
        def not_equal(left, right)
          raise "Not applicable to sphinx."
        end

        # >> select { |u| u.name =~ 'chris' }
        # => #=~( call(:name), 'chris' )
        def =~(left, right)
          raise "Not applicable to sphinx."
        end

        # !~
        # >> select { |u| u.name !~ 'chris' }
        # => #not_regexp( call(:name), 'chris' )
        def not_regexp(left, right)
          raise "Not applicable to sphinx."
        end

        ##
        # Etc.
        def <(left, right)
          raise "Not applicable to sphinx."
        end

        def >(left, right)
          raise "Not applicable to sphinx."
        end

        def >=(left, right)
          raise "Not applicable to sphinx."
        end

        def <=(left, right)
          raise "Not applicable to sphinx."
        end

        # >> select { |u| [1, 2, 3].include? u.id }
        # => #include?( [1, 2, 3], call(:id) )
        def include?(left, right)
          "#{left}#{right}"
        end
        
        def field? str
          str =~ /:/
        end
        
        def quotify string
          "\"#{string}\"" unless field?
        end
      end
    end
  end
end
