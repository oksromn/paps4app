class Film < ApplicationRecord
  has_many :comments
  has_many :ratings

  validates :title, presence: true
  validates :year, presence: true
  validates :genre, presence: true
  validates :company, presence: true
  validates :producer, presence: true
  validates :actors, presence: true
  validates :cost, presence: true
  validates :image_link, presence: true, format: { with: /(http|https):\/\/\S+\/\S+.jpg/ }

  def self.search(keywords)
    if keywords
      where(
        "title LIKE ? OR year = ? OR actors LIKE ? OR producer LIKE ? OR company LIKE ?",
        "%#{keywords}%",
        keywords.to_i,
        "%#{keywords}%",
        "%#{keywords}%",
        "%#{keywords}%"
      ).order('id DESC')
    else
      order('id DESC')
    end
  end
end
