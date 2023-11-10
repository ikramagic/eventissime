class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy payment_success]

  require 'stripe'

  Stripe.api_key = Rails.configuration.stripe[:secret_key]

  YOUR_DOMAIN = 'https://eventissime-4f42df2520e7.herokuapp.com/'

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: @event.title,
            description: @event.description,
          },
          unit_amount: @event.price * 100, 
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: payment_success_event_url(@event),
      cancel_url: event_url(@event),
    })
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.admin = current_user

    respond_to do |format|
      if @event.save
        attach_illustration if params[:event][:illustration].present?
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
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
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def payment_success
    if current_user
      @attendance = Attendance.new(user: current_user, event: @event, stripe_customer_id: params[:customer])
      if @attendance.save
        #UserMailer.confirmation_email(@attendance).deliver_now
        redirect_to event_path(@event), notice: 'Payment successful!'
      else
        redirect_to event_path(@event), alert: 'Failed to create attendance record.'
      end
    else
      redirect_to event_path(@event), alert: 'User not authenticated.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :illustration)
    end

    def attach_illustration
      @event.illustration.attach(params[:event][:illustration])
    end
end