module EventsHelper
  include ActsAsTaggableOn::TagsHelper

  def is_single_view
    action_name == 'show'
  end
end
