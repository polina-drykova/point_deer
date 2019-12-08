# frozen_string_literal: true

require 'carrierwave'

class CkeditorAttachmentFileUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave
  include Cloudinary::CarrierWave

  # [:extract_content_type, :extract_size, :extract_dimensions].each do |method|
  #   define_method :"#{method}_with_cloudinary" do
  #     send(:"#{method}_without_cloudinary") if self.file.is_a?(CarrierWave::SanitizedFile)
  #     {}
  #   end
  #   alias_method :"#{method}_without_cloudinary", method
  #   alias_method method, :"#{method}_with_cloudinary"
  # end

  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/ckeditor/attachments/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    Ckeditor.attachment_file_types
  end
end
