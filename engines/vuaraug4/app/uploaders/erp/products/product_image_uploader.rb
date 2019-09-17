# encoding: utf-8
module Erp
  module Products
    class ProductImageUploader < CarrierWave::Uploader::Base

      # Include RMagick or MiniMagick support:
      # include CarrierWave::RMagick
      include CarrierWave::MiniMagick

      # Choose what kind of storage to use for this uploader:
      storage :file
      # storage :fog

      # Override the directory where uploaded files will be stored.
      # This is a sensible default for uploaders that are meant to be mounted:
      def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end

      # For backend list
      version :extra_small do
        #process :resize_to_fill => [80, 80]
      end
      
			version :small do
				process :resize_to_fill => [150, 150]
			end

			version :medium do
				process :resize_to_fill => [330, 330]
			end

			version :large do
				process :resize_to_fill => [600, 600]
			end
      
      version :extra_large do
				#process :resize_to_fill => [330, 330]
			end
			
    end
  end
end
