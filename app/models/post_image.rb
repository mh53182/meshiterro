class PostImage < ApplicationRecord

  has_one_attached :image

  belongs_to :user

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/image/no_image.jpeg')
      image.atacch(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    
  end

end
