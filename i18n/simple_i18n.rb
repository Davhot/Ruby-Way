require 'i18n'
I18n.backend.store_translations(:en, greeting: { hello: "Hello there!" })
I18n.backend.store_translations(:ja, greeting: { hello: "Hello on ja" })

puts I18n.locale
puts I18n.t('greeting.hello')

I18n.locale = :ja
puts I18n.t('greeting.hello')
