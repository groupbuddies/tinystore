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

  def is_client?
    current_store.present? && current_user.nil?
  end

  def is_store_owner?
    current_user.present? && current_store.user == current_user
  end

  def for_store_owner(&block)
    yield block if is_store_owner?
  end

  def for_store_client(&block)
    yield block unless is_store_owner?
  end
end
