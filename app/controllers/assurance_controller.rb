class AssuranceController < ApplicationController
    get '/assurances' do
      binding.pry
        if logged_in?
        #@user =curent_user
        @assurances = Assurance.all
        erb :'/assurances/index'
        else
          redirect '/login'
      end
      end
    
      get '/assurances/new' do
        if logged_in?
        erb :'/assurances/new'
        else
          redirect '/login'
        end
      end
    
      get '/assurances/:id' do
        if logged_in?
        @assurance = Assurance.find(params[:id])
        erb :'/assurances/show_assurance'
        else
          redirect '/login'
        end
      end
    
      get '/assurances/:id/edit' do
        if logged_in?
          @assurance = Assurance.find(params[:id])
          erb :'/assurances/edit'
        else
          redirect '/login'
        end
      end
    
      post '/assurances' do
        if logged_in?
          if params[:owner] == "" || params[:phone]== "" || params[:model] == "" || params[:immatriculation]== "" || params[:color] == ""
            redirect '/assurances/new'
          else
            @assurance = Assurance.create(:owner=> params[:owner], :phone=> params[:phone], :model=> params[:model], :immatriculation=> params[:immatriculation], :color => params[:color])
            @assurance.user_id = current_user.id
            @assurance.save
            redirect "/assurances/#{id}"
          end
        end
      end
    
      delete '/assurances/:id/delete' do
        if logged_in?
        @assurance = Assurance.find_by(params[:id])
        @assurance.delete
        else
          redirect '/login'
        end
        redirect '/assurances'
      end
    
      patch '/assurances/:id/edit' do
        if logged_in?
        @assurance = Assurance.find(params[:id])
        @assurance.owner = params[:owner]
        @assurance.phone = params[:phone]
        @assurance.model = params[:model]
        @assurance.immatriculation = params[:immatriculation]
        @assurance.color = params[:color]
        @assurance.save
      end
    end    
   
end