require 'i18n'
I18n.load_path = Dir["locale/*"]
I18n.enforce_available_locales = true
I18n.locale = ENV["LANG"].split(?_).first || :en

puts I18n.t('ask.name')
name = I18n.t('answer.name')
puts I18n.t('ask.location')
location = I18n.t('answer.location')
puts I18n.t('ask.children')
children = I18n.t('answer.children')
puts I18n.t('ask.thanks')

puts I18n.t('result.lives_in', name: name, location: location) +
     I18n.t('result.children', count: children)
