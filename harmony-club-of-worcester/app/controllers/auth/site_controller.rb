class Auth::SiteController < ApplicationController

    before_action :authenticate_user!

    def panel
        @user=current_user
        authorize self
    end

    def page
      @page = Page.friendly.find(params[:id])
      authorize @page, :show?, policy_class: AuthorizationPolicy
    end

    def change_permissibles
      @temp_records = params[:type].constantize.all if params[:type]
      @records = []

      @temp_records.each do |record|
        @records.append(record) if !record.title.include?("«")
      end

    end

    def change_form_fields
        @page_type=params[:type]
    end

    def change_permissible_id
      @checked = params[:checked]
    end
end