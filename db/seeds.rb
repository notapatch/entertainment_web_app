include FactoryBot::Syntax::Methods

Rails.logger.debug "Seed starting"

User.delete_all

path = Rails.root.join("_starter/assets/user_images/")
images = Dir.children(path)

1.upto(2).each do |_index|
  staff = create(:staff)
  image = images.pop
  staff.avatar.attach(io: File.open(path + image), filename: image, content_type: "image/jpg")
end

1.upto(4).each do |_index|
  customer = create(:customer)
  image = images.pop
  customer.avatar.attach(io: File.open(path + image), filename: image, content_type: "image/jpg")
end

Rails.logger.debug "Seed ending"
