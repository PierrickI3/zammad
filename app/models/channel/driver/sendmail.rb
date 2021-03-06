# Copyright (C) 2012-2016 Zammad Foundation, http://zammad-foundation.org/

class Channel::Driver::Sendmail
  def send(_options, attr, notification = false)

    # return if we run import mode
    return if Setting.get('import_mode')

    mail = Channel::EmailBuild.build(attr, notification)
    mail.delivery_method :sendmail
    mail.deliver
  end
end
