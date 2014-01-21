module FlightsHelper
	def flight_row(flight)
		[
      flight.airline.name,
      flight.departure, 
      flight.arrival,
      flight.price,
      flight.duration
    ]
  end
end

