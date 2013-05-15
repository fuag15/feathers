# if we are in development we create a test user and delete all others
# if we are in production we  create a user and dont destroy all as we want it to raise errors!
# should not delete a user as it will purge related resources
if Rails.env == 'development'
  User.destroy_all
  User.create! email: 'test@test.com', password: 'testing', role: 'admin'
elsif Rails.env == 'production'
  User.create! email: 'mike@steelpigeondesign.com', password: 'changeme', role: 'admin'
end