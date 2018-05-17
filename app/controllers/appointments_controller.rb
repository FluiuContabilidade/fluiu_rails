class AppointmentsController < ApplicationController

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


  private
    def appointment_params
      params.require(:appointment).permit(:owner, :day, :event)
    end

end
