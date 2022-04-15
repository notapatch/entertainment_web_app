module EnumHelper
  def human_enum_name(model_name:, enum_name:, enum_key:)
    I18n.t("activerecord.attributes.#{model_name}.#{enum_name.to_s.pluralize}.#{enum_key}")
  end
end
