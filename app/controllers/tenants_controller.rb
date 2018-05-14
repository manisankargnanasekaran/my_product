class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: %i[create]
  # GET /tenants
  def index
    @tenants = Tenant.all

    render json: @tenants
  end

  # GET /tenants/1
  def show
    render json: @tenant
  end

  # POST /tenants
  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save!
      @tenant.roles.first.users.first.login_detail.update(tenant_id: @tenant.id)
      render json: @tenant, status: :created, location: @tenant
    else
      render json: @tenant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tenants/1
  def update
    if @tenant.update(tenant_params)
      render json: @tenant
    else
      render json: @tenant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tenants/1
  def destroy
    @tenant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tenant_params
      params.require(:tenant).permit(:tenant_name, :tenant_code, :tenant_location, :is_active, :deleted_at, :tenant_key, address_attributes: [:id, :address_line1,:address_line2, :city, :state, :country, :postal_code], contact_attributes: [:id, :email, :mobile1, :mobile2, :fax], social_network_attributes:[:id, :facebook, :google_plus, :skype, :twiter, :linked_in], roles_attributes: [:id, :role_name, :role_code, users_attributes:[:id, :salutation, :first_name, :last_name, :is_active, :deleted_at, :user_name, address_attributes: [:id, :address_line1,:address_line2, :city, :state, :country, :postal_code], contact_attributes: [:id, :email, :mobile1, :mobile2, :fax], social_network_attributes:[:id, :facebook, :google_plus, :skype, :twiter, :linked_in], login_detail_attributes: [:id, :email, :password]]])
    end
end
