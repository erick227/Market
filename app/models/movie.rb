class Movie < Medium
  alias_attribute :director, :author
  alias_attribute :genre, :secondary_info
end
