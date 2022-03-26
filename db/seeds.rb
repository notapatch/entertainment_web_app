include FactoryBot::Syntax::Methods

Rails.logger.debug "Seed starting"

User.delete_all

1.upto(2).each do |_index|
  create(:staff)
end

1.upto(4).each do |_index|
  create(:customer)
end

Rails.logger.debug "Seed ending"
