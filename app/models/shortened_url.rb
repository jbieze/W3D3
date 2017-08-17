class ShortenedUrl < ActiveRecord::Base

  def random_code
    code = SecureRandom.urlsafe_base64(16)

    while ShortenedUrl.exists?(code)
      code = SecureRandom.urlsafe_base64(16)
    end

    self.short_url = code
  end

  def self.shorten(user, long_url)
    x = ShortenedUrl.new(:long_url => long_url)
    x.random_code
    x.save
    y = ShortenedUser.new(:user_id => user.id, :shortened_url_id => x.id)
    y.save
  end

  validates :long_url, :short_url, presence: true, uniqueness: true

  has_many :shortened_users,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUser

  has_many :submitter,
    through: :shortened_users,
    source: :user
end
