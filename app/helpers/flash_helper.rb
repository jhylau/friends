module FlashHelper
  def flash_class(level)
    case level
    when :notice then "alert-warning"
    when :error then "alert-warning"
    when :alert then "alert-warning"
    end
  end
end