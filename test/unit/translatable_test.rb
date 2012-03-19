require 'test_helper'

class Translated
  attr_accessor :name_es, :name_ca
  include Translatable
  translates :name

end

describe Translatable do

  it "setter with current locale" do
    t = Translated.new
    I18n.locale = :es
    t.name = 'Nombre'
    I18n.locale = :ca
    t.name = 'Nom'
    t.name_es.must_equal 'Nombre'
    t.name_ca.must_equal 'Nom'
  end

  it "getter with current locale" do
    t = Translated.new
    t.name_es = 'Nombre'
    t.name_ca = 'Nom'
    I18n.locale = :es
    t.name.must_equal 'Nombre'
    I18n.locale = :ca
    t.name.must_equal 'Nom'
  end

  it "should fall back to current locale" do
    I18n.default_locale = :es
    t = Translated.new
    t.name_es = 'Nombre'
    I18n.locale = :ca
    t.name.must_equal 'Nombre'
  end
end
