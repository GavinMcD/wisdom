class User < ActiveRecord::Base
  has_secure_password
  
  # Relationships
  # -----------------------------------
  has_many :nuggets, :dependent => :destroy
  
  # new columns need to be added here to be writable through mass assignment
  # whenever you create or update a model in your controllers by using mass assignment
  attr_accessible :email, :password, :password_confirmation, :description
  
  # Validations
  # -----------------------------------
  validates_presence_of     :password, :on => :create 
  validates_confirmation_of :password
  validates_length_of       :password, :minimum => 6
  validates_format_of       :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_uniqueness_of   :email
  validates_presence_of     :email, :on => :create

end
