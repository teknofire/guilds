class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :omniauthable, omniauth_providers: [ :discord ]

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates_inclusion_of :timezone, in: ActiveSupport::TimeZone.all.map(&:name), allow_nil: true

  has_many :user_features
  has_many :features, through: :user_features

  has_many :members
  has_many :teams, through: :members

  scope :not_in_team, ->(team) { where.not(id: team.users) }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def feature?(name)
    admin? || features.where(name: name).any?
  end

  def to_s
    name
  end
end
