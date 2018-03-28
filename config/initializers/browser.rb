Rails.configuration.middleware.use Browser::Middleware do
  redirect_to unsupported_browser_path(browser: :modern) if !browser.modern? && !request.env['PATH_INFO'].start_with?('/api/') && !request.env['QUERY_STRING'].include?('disposition=inline')
end
