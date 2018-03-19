require 'set'

module ActiveSupport::Callbacks::ClassMethods
  def without_callback(*args, &block)
    # Get all Filters (meaning all callback names as symboles)
    filters = self.get_callbacks(args[0])
                        .map(&:filter)

    unless filters.to_set.superset?(args[1..args.length].to_set)
      raise Exception.new("Attempt to suppress a non existing callback") if Rails.env.development?
    end

    begin
      skip_callback(*args)
      yield
    ensure
      set_callback(*args)
    end
  end
end
