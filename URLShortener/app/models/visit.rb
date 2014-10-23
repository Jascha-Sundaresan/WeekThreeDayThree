class Visit < ActiveRecord::Base
  validates :visitor, :visited_url, presence: true
  
  belongs_to(
    :visitor,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  belongs_to(
    :visited_url,
    class_name: "ShortenedUrl",
    foreign_key: :shortened_url_id,
    primary_key: :id
  )
  
  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor: user, visited_url: shortened_url)
  end
end
