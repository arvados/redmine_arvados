require_dependency 'application_helper'

module ApplicationHelperPatch

  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :textilizable, :uuid_linking
    end
  end

  module InstanceMethods
    # overload textilizable to link UUIDs automatically
    def textilizable_with_uuid_linking(*args)
      text = textilizable_without_uuid_linking(*args)
      return text.gsub(/([^=\/])([a-zA-Z0-9]{5}\-[a-zA-Z0-9]{5}\-[a-zA-Z0-9]{15})(\W|$)/,'\\1<a href="https://arvadosapi.com/\\2">\\2</a>\\3').html_safe
    end
  end
end

ApplicationHelper.send(:include, ApplicationHelperPatch)
