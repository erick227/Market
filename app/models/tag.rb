class Tag < ActiveRecord::Base
  has_and_belongs_to_many :media

  scope :recent, ->() {
    tags = Medium
      .uploadedRecently
      .map(&:tags)
      .flatten

    freq = tags.inject(Hash.new(0)) do |freq, n|
      freq[n] += 1
      freq
    end
      
    freq.to_a.sort_by do |a, b|
      a[1] <=> b[1]
    end.map do |x|
      x[0]
    end
  }

end
