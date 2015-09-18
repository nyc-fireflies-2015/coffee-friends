OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1021559357883859', 'cb78d8c9cb42235a6a28a91efffdc674',
  :scope => 'email,public_profile,user_friends', :display => 'page'
end
