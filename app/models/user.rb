# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  has_many :shortened_users,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUser

  has_many :submitted_urls,
    through: :shortened_users,
    source: :shortened_url

end
