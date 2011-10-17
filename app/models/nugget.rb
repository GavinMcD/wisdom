class Nugget < ActiveRecord::Base
  # Relationships
  # -----------------------------------
  belongs_to :user
  
  # new columns need to be added here to be writable through mass assignment
  # whenever you create or update a model in your controllers by using mass assignment
  attr_accessible :audience, :topic, :body
  
  # Validations
  # -----------------------------------
  
  default_scope :order => "created_at DESC"

end
