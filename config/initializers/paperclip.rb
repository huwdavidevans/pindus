Paperclip.interpolates :shid do |attachment, style|
	Base64.urlsafe_encode64(attachment.instance.id.to_s+"-"+attachment.original_filename.gsub(/#{Regexp.escape(File.extname(attachment.original_filename))}\Z/, "")).tr('=','')
end

Paperclip.interpolates :year do |attachment, style|
  attachment.instance.created_at.year
end

Paperclip.interpolates :month do |attachment, style|
  attachment.instance.created_at.month
end

Paperclip.interpolates :day do |attachment, style|
  attachment.instance.created_at.day
end

Paperclip.interpolates :default_image_url do |attachment, style|
  ActionController::Base.helpers.image_path("pic/#{style}/default.png")
end