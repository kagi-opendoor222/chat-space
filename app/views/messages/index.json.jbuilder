json.array! @new_messages do |new_message|
json.id         new_message.id
json.text       new_message.text
json.image      new_message.image.url
json.created_at new_message.created_at.strftime('%Y/%m/%d %H:%M:%S')
json.user_name  new_message.user.name
end
