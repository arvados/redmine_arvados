require_dependency 'application_helper'

module ApplicationHelperPatch

  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :textilizable, :uuid_linking
      alias_method_chain :textilizable, :ci_linking
    end
  end

  module InstanceMethods
    # overload textilizable to link UUIDs automatically
    def textilizable_with_uuid_linking(*args)
      text = textilizable_without_uuid_linking(*args)
      return text.gsub(/([^=\/])([a-zA-Z0-9]{5}\-[a-zA-Z0-9]{5}\-[a-zA-Z0-9]{15})(\W|$)/,'\\1<a href="https://arvadosapi.com/\\2">\\2</a>\\3').html_safe
    end

    # overload textilizable to link CI links automatically
    def textilizable_with_ci_linking(*args)
      text = textilizable_without_ci_linking(*args)
      return text.gsub(/([^:\"])https:\/\/ci.arvados.org\/view\/([a-zA-Z0-9\-]+)\/job\/([a-zA-Z0-9\-]+)\/([0-9]+)\/(\W|$)/,'<a href="https://ci.arvados.org/view/\\2/job/\\3/\\4/"><img src="https://ci.arvados.org/buildStatus/icon?job=\\3&#38;build=\\4" alt="" /></a>\\5').html_safe
    end

  end
end

ApplicationHelper.send(:include, ApplicationHelperPatch)
