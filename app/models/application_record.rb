class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # enumをi18n化するためのメソッド①
  def enum_i18n(enum_name)
    return nil if send(enum_name).nil?

    I18n.t!("enums.#{model_name.i18n_key}.#{enum_name}.#{send(enum_name)}")
  end

  # enumをi18n化するためのメソッド②
  def self.enums_i18n(enum_name)
    send(enum_name.to_s.pluralize).transform_keys do |key|
      I18n.t!("enums.#{model_name.i18n_key}.#{enum_name}.#{key}")
    end
  end
end
