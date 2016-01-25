class Home < SitePrism::Page
  set_url "/home"
  
  element :body, "#post_body"
  element :send, ".btn.right"
end