class User < ActiveRecord::Base
  ROLES = %w[admin quizmaster candidate]

  attr_accessor :login
  has_many :exams

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:github]

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.find_from_omniauth(auth_data)
    User.where(["lower(username) = :username OR lower(email) = :email", 
                { :username => auth_data[:info][:nickname].downcase,
                  :email => auth_data[:info][:email] }]).first
  end

  def self.create_from_omniauth(auth_data)
    user = User.new.tap do |u|
      u.username = auth_data[:info][:nickname]
      u.email = auth_data[:info][:email] || ''
      u.provider = auth_data[:provider]
      u.uid = auth_data[:uid]
      u.save(:validate => false)
    end
  end

  def self.from_omniauth(auth_data)
    User.find_from_omniauth(auth_data) || User.create_from_omniauth(auth_data)
  end

  def admin?
    self.role == 'admin'
  end

  def quizmaster?
    self.role == 'quizmaster'
  end
end
