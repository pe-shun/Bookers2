class Book < ApplicationRecord
  has_one_attached :title
  belongs_to :user

  def get_title
    if title.attached?
      title
    else
      'no_image.jpg'
    end
  end

end
