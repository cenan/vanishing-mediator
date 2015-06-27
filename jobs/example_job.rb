job :example do
  schedule_minutes 30

  get_http "http://cenanozen.com/" do |result|
    result.status
  end

  check do |value|
    value == 200
  end

  alert_mail "me@cenanozen.com" do |mail|
    mail.subject "Alert for cenanozen.com"
    mail.contents "cenanozen.com is down!!1"
  end
end
