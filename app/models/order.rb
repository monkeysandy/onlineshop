class Order < ApplicationRecord
  has_many :lineitems
  belongs_to :user, optional: true
  PAYTYPES = ["check", "credit card", "Paypal", "Venmo"]
  validates(:name, :address, :email, presence: true)
  validates(:paytype, inclusion: PAYTYPES)

  def add_order_id_in_lineitems(cart)
    cart.lineitems.each do |lineitem|

      lineitem.order_id = self.id
      lineitem.save!
    end
  end




end
