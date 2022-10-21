class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :orders
         has_many :addresses
         has_many :cart_items

         def full_name
           self.last_name+" "+self.first_name
         end

         def full_name_kana
           self.last_name_kana+" "+self.first_name_kana
         end

         def customer_address
          "〒" + self.postal_code + " " + self.address + " " + self.last_name + " " + self.first_name
         end


end
