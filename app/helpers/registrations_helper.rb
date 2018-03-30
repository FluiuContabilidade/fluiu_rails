module RegistrationsHelper

  def self.treat_error_messages(resource)

    if resource.errors.messages.include?(:email)
      return "Email inválido."
    end

    return ""
  end

end
