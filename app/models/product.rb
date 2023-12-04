class Product < ApplicationRecord
  validates(:name, :description, :image, presence: true)
  validates(:price, numericality: { greater_than: 0 })
  validates(:name, uniqueness: true)
  validates(:image, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  })

  has_many :lineitems

  before_destroy(:make_sure_no_line_items)

  def make_sure_no_line_items
    if self.line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end




end
