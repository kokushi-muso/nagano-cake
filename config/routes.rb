Rails.application.routes.draw do
  namespace :admin do
    resources :genres, except:[:destroy, :show, :new]
    resources :customers, except:[:destroy, :create, :new]
    resources :items, except:[:destroy]
    resources :orders, except:[:new, :destroy, :edit, :create] do
    resources :order_items, only:[:update]
    end
  end

  scope module: :public do
    resources :addresses, except:[:new, :show]
    resources :orders, except:[:destroy, :edit, :update]
    resources :orders do
      post :confirm, action: :confirm, on: :new
      get :thanks, action: :thanks, on: :new
    end
    resources :carts, except:[:new, :show, :edit] do
      collection do
        delete :destroy_all
      end
    end
    resources :items, only:[:index, :show]
    root to: 'homes#top'
    get "about" => 'homes#about'
    get "customers/mypage" => "customers#mypage"
    resources :customers, only:[:edit, :update] do
      collection do
        get 'unsubcribe' #退会画面
        patch 'withdraw' #is_validを更新する
      end
    end
  end

  devise_for :customers,
  path:"",
  path_names: {sign_up:"", sign_in:"login", sign_out:"logout", registration:"sign_up"},
  controllers: {
    sessions:"customers/sessions",
    passwords:"customers/passwords",
    registrations:"customers/registrations"
  }

  devise_for :admins,
  controllers: {
    sessions:"admins/sessions",
    passwords:"admins/passwords",
    registrations:"admins/registrations"
  }

end