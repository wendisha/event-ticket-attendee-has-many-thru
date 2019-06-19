class Event
    attr_accessor :name, :ticket_price
    @@all = []

    def initialize(name, ticket_price)
        @name = name
        @ticket_price = ticket_price
        @@all << self
    end

    def self.all
        @@all
    end

    def event_tickets #helper method
        Ticket.all.select {|ticket| ticket.event == self}
    end

    def attendees
        event_tickets.map {|ticket| ticket.attendee}
    end

    def average_age
        average_age = 0
        attendees.each do |attendee|
            average_age += attendee.age 
        end
        average_age /= attendees.count
    end
end
# Event.all
  # Returns an array of all Events
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
