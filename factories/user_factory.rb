Factory.define :user do |user|
# use sqquence to create a ransomized user name (user + num)
  user.sequence(:email) { |n| "user#{n}@ticketee.com" }
  user.password("password")
  user.password_confirmation("password")
end
