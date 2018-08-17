# frozen_string_literal: true

# The Bookings Controller.
class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show; end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @contact = @booking.build_contact
    @person = @contact.persons.build
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @contact = @booking.build_contact(contact_params)
    @person = @contact.persons.build(person_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url,
                    notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
    @contact = @booking.contact
    @person = @contact.persons.first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:date_in, :date_out, :status, :requested, :confirmed, :contract_signed, :deposit_payed, :payed)
  end

  def contact_params
    params.require(:booking).permit(:street, :city, :postalCode, :phone, :email)
  end

  def person_params
    params.require(:booking).permit(:first_name, :last_name, :salutation)
  end

end
