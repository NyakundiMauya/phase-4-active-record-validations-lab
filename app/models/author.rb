class Author < ApplicationRecord
    validates :name, presence: true
validates :name, uniqueness: { case_sensitive: false }
validates :phone_number, length: { is: 10 }, numericality: { only_integer: true }
validates :title, presence: true

validate :case_sensitive_name_uniqueness

def case_sensitive_name_uniqueness
  if Author.exists?(name: name)
    errors.add(:name, "has already been taken")
  end
end

end
