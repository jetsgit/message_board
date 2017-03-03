require 'ffaker'
password = 'xeaerqern34m4343IkIIIza'

myusers = []
100.times do 
  usr = User.new
  usr.first_name = FFaker::Name::first_name
  usr.last_name = FFaker::Name::last_name
  usr.email = FFaker::Internet.email
  usr.password = '#{password}'
  usr.password_confirmation = '#{password}'
  usr.save
  myusers << usr
end

comment_length = [2,3,4,5]
msg_length = [4,5,6,7,8]

mymsg = []
200.times do
  msg = Message.new
  msg.title = FFaker::Book.title
  msg.content = FFaker::HipsterIpsum.paragraph msg_length.sample
  msg.user_id = myusers.sample.id
  msg.save
  mymsg << msg
end

300.times do
  cmt = Comment.new 
  cmt.comment = FFaker::HipsterIpsum.paragraph comment_length.sample
  cmt.user_id = myusers.sample.id
  cmt.message_id = mymsg.sample.id
  cmt.save
end


