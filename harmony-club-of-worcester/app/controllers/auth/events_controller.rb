class Auth::EventsController < ApplicationController
    before_action :set_event, only: %i[ show edit update destroy ]
    before_action  :authenticate_user!
  
    # GET /events or /events.json
    def index
      @events = Event.all - Event.where(title: "«Temp Event»")
      authorize Event.all, policy_class: AuthorizationPolicy
    end
  
    # GET /events/1 or /events/1.json
    def show
      authorize @event, policy_class: AuthorizationPolicy
    end
  
    # GET /events/new
    def new
      puts "\n\n\n"
      puts params
      puts "\n\n\n"
      @event = Event.new
      @event.eventstart = params[:eventstart]
      @event.eventend = params[:eventend]
      @event.occurence = params[:occurence]
      authorize @event, policy_class: AuthorizationPolicy
    end
  
    # GET /events/1/edit
    def edit
      authorize @event, policy_class: AuthorizationPolicy
    end
  
    # POST /events or /events.json
    def create
      puts "\n\n\n"
      puts params
      puts "\n\n\n"
      @event = Event.new(event_params)
      respond_to do |format|
        if @event.save
          format.html { redirect_to auth_event_path(@event), notice: "Event was successfully created." }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /events/1 or /events/1.json
    def update
      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to auth_event_path(@event), notice: "Event was successfully updated." }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /events/1 or /events/1.json
  def destroy
    authorize @event, policy_class: AuthorizationPolicy

    #Permission.all.each do |permission|
    #  if permission.permissible_type == "Event" && permission.permissible_id == @event.id
    #    permission.destroy
    #  end
    #end

    @event.destroy
    respond_to do |format|
    format.html { redirect_to auth_events_url, notice: "Event was successfully destroyed." }
    format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :details, :photo, :eventstart, :eventend, :occurence)
    end
end