class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create]

  def calendar
    @appointments = Appointment.get_monthly_events(Time.now.month).sort  {|x,y| x.item_date[0..1] <=> y.item_date[0..1]}
    @client = @appointments.reject { |a| a.item_type != "client" }
    @agent = @appointments.reject { |a| a.item_type != "agent" }
    # byebug
  end
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Operação realizada com sucesso!'
      redirect_to '/home'
    else
      flash[:error] = 'Um erro ocorreu.'
      redirect_to '/home'
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    if @appointment.update(appointment_params)
      flash[:success] = 'Operação realizada com sucesso!'
      redirect_to '/home'
    else
      flash[:error] = 'Um erro ocorreu.'
      redirect_to '/home'
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:item_date, :item_type, :item_description)
    end
end
