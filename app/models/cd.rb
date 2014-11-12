class CD < Medium
  alias_attribute :artist, :author
  alias_attribute :album, :secondary_info
end
