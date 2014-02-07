module UrlHelper
  def with_subdomain(subdomain = '')
    subdomain += '.' unless subdomain.empty?
    [subdomain, request.domain, request.port_string].join
  end

  def url_for(options = nil)
    if options.kind_of?(Hash) && options.has_key?(:subdomain)
      options[:host] = with_subdomain(options.delete(:subdomain))
    end
    super
  end

  def current_store
    Store.where(slug: request.subdomain).first
  end

  def is_in_store
    redirect_to root_url unless current_store.present?
  end
end
