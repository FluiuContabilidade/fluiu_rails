class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update]
  before_action :set_appointment, only: [:edit, :update, :delete]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create appointment_params
    if @appointment.save
      flash[:success] = 'Evento criado com sucesso!'
    else
      flash[:error] = 'Evento não foi criado. Algum erro ocorreu.'
    end
    redirect_to '/appointments'
  end

  def update
    @appointment.update_attributes(appointment_params)
    flash[:success] = 'Operação efetuada com sucesso!'
    redirect_to '/appointments'
  end

  def delete
    @appointment.destroy
    flash[:success] = "Evento deletado com sucesso."
    redirect_to '/appointments'
  end

  def edit
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  private
    def appointment_params
      params.require(:appointment).permit(:owner, :day, :event)
    end

end
