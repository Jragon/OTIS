module DiscussionsHelper
  def truncate_observations(observations)
    raw truncate(sanitize(simple_format(observations), :tags => %w(br p) ), :length => 150, :separator => ' ')
  end
end
