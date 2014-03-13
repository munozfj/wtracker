class WeightTrackerDevise::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        #Se pasaron todas las validaciones
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        #respond_with resource, location: after_sign_up_path_for(resource)
        redirect_to panel_path
      else
        puts "2"
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      #Me mantengo en la pantalla porque no pase las validaciones
      clean_up_passwords resource
      respond_with resource
    end
  end 
end 