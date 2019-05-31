class Post < ApplicationRecord
  after_commit :create_tags, on: :create
  belongs_to :user
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags
  has_one_attached :image


  validate :image_presence

  def image_presence
    errors.add(:image, "Can't be blank. Please upload an image") unless image.attached?
  end

  def create_tags
    extract_hashtags_from_post.each do |tag|
      hash_tags.create(name: tag)
    end
  end

  private

  def extract_hashtags_from_post
    description.to_s.scan(/#\w+/).map{ |word| word.gsub("#", "") }
  end
end
