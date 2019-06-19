require 'pry'

class Attendee
    attr_reader :name, :age
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def events #helper method
        attendee_tickets = Ticket.all.select {|ticket| ticket.attendee == self}
        attendee_tickets.map {|ticket| ticket.event}
    end

    def buy_ticket(event)
        Ticket.new(event, self)
    end

    def money_spent
        total = 0  
        events.each do |event|
            total += event.ticket_price
        end
        return total
    end
end

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events
  
class ProgramStart
    attendee1 = Attendee.new("Test1", 18)
    attendee2 = Attendee.new("Test2", 20)
    attendee3 = Attendee.new("Test3", 22)
    event1 = Event.new("Event1", 30)
    event2 = Event.new("Event2", 15)
    event3 = Event.new("Event3", 85)
    ticket1 = Ticket.new(event1, attendee1)
    ticket2 = Ticket.new(event2, attendee1)
    ticket3 = Ticket.new(event1, attendee2)
    ticket4 = Ticket.new(event2, attendee2)
    ticket5 = Ticket.new(event3, attendee2)
    binding.pry
end
