class FileResource < ApplicationRecord
  has_one_attached :file_data



  def generate_jwt
    JWT.encode({ file_resource_id: id, exp: 1.day.from_now.to_i }, Rails.application.secret_key_base)
  end
end

  
  
  
