class User < ApplicationRecord
  rolify
  # enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # DEFAULT devise :database_authenticatable, :registerable,
  # DEFAULT        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :rememberable

end
