# encoding: utf-8

class SyncfileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
 
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{Rails.root}/private/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.userid}"
    #"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.userid}"
  end

#  def extension_white_list
#    %w(pdf doc htm html docx)
#  end
 
 
  
  
end
