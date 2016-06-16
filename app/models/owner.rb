class Owner < ActiveRecord::Base
  # TODO: add validations
  validates :first_name, presence: true, uniqueness: true, length: {minumum:6, maximum: 255}
  validates :last_name, presence: true, uniqueness: true, length: {minumum:6, maximum: 255}
  validates :email, presence: true, uniqueness: true, length: {minumum:6, maximum: 255}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
       if phone.present?
      phone.gsub!(/^1/, "")
      phone.gsub!(/[()-.]/,"")
    end
    # stretch
  end

end
