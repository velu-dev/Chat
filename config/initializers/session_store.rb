ChatApp::Application.config.session_store :cookie_store, 
                                             :key => "current_user",
                                             :expire_after => 1.minute