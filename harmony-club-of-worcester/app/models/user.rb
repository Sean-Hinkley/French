class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :validatable
        
  has_and_belongs_to_many :roles

  def self.create_new_user(email, password)
    user = User.new(email: email, password: password)
    return user.save
  end

  def after_database_authentication
    Rails.logger.info "Successful Login!"
  end


end
