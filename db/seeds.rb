# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w{ admin api user }.each do |role|
  r = Role.find_or_create_by!(name: role)
  puts "Created role: #{role}, #{r.id}"
end

%w{ admin@example.com user@example.com api@example.com }.each do |user|
  u = User.find_or_create_by!(email: user) do |uu|
    uu.password = 'password'
    uu.password_confirmation = 'password'
  end

  role = user.split('@')[0]
  u.add_role role
  u.save!

  puts "Created user: #{user}, #{u.id} #{u.has_role? role}"
end

# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

# (1..76).each do |i|
#   Post.create(name: "This is post #{i}", body: "This is the body of post #{i}")
# end
