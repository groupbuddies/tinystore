module DeviseHelper
  def after_sign_in_path_for(resource)
    store_url(subdomain: resource.store.slug)
  end

  def after_sign_up_path_for(resource)
    store_url(subdomain: resource.store.slug)
  end

  def after_sign_out_path_for(resource)
    root_url
  end
end
