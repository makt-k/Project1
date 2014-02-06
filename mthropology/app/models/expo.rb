class Expo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :art, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :art, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    find(:all, :conditions => ['tag LIKE ?', "%#{search}%"])
  end

end
