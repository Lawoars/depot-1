#encoding: utf-8
I18n.load_path = Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]
I18n.default_locale = :ru

LANGUAGES = [
    ['Русский', 'ru'],
    ['English', 'en'],
    ['Quenya', 'qu']
]