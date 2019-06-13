# Many-To-Many Relationships Review

Let's say we're building an app to sell tickets for events. Our app will need these three models: `Event`, `Ticket`, and `Attendee`.

We can visualize the relationship of our models like this:

Event >- Ticket -< Attendee

When describing this relationship, we'd say an `Event` has many `Attendee`s through `Ticket`s and also that an `Attendee` has many `Event`s through `Ticket`s. A `Ticket` belongs to an `Event` and an `Attendee.`

Without a `Ticket`, an `Event` would have no `Attendee`s, and vice-versa. The `Ticket` model, then, is our single source of truth in this relationship. Think about it from experience: when a ticket is created for you, it has the name of the `Attendee`, *you*, on it, as well as information about the `Event`. If we want to know who is going to be at the event, we would first get all `Ticket` instances associated with that `Event`, and then we'd make a list from those selected `Ticket`s of the `Attendee`s on each of them. If you're an `Attendee` who wants information about the `Event`, you'd first look through all of your `Ticket`s and check the `Event` information on each one. The `Ticket` is proof of both the connection between the `Event` and the `Attendee`. Single Source of Truth!

## Topics

- Classes vs Instances
- Variable Scope ( Class, Instance, Local )
- Object Relationships
- Arrays and Array Methods
- Class Methods

## Notes

Your goal is to build out all of the methods listed in the deliverables below. Do your best to follow Ruby best practices. For example, use higher-level array methods such as `map`, `select`, and `find` when appropriate in place of `each`.

We've provided you with a console that you can use to test your code! That's right: no tests. It's up to you to see if your code works. To enter a console session, run `ruby tools/console.rb` in your terminal. *You must run this from this assignment's root directory.* A pry session will open up, and you'll be able to test out the methods that you wrote. Take a look at that file to see how you can pre-define variables and create object instances, rather than manually doing it in every single console session. When you run `ruby tools/console.rb`, a pry session will start, and all the pre-defined variables that you wrote in there will have been created and you can use them in the session without having to define them again!

## Deliverables

The files for each model have already been created for you in the `app/models` folder.  Go into each file and write out everything necessary to get the methods below to work. Methods separated with `.` are class methods, while methods separated with `#` are instance methods. For example: `Event.all` denotes a class method, and `Event#sell_ticket` denotes an instance method.

*NOTE: In order to build out the methods below, it may be in your interest to write some extra helper methods! These are not required methods per the deliverables, but they will make your code a lot nicer to look at. Remember that we generally want each method to complete only one task! If it does more than one task, we should break that into a smaller method when possible.*



### `Event`

Each `Event` should have a name that is a string and a ticket_price that is an integer. It's up to you to make up these attributes for each `Event` instance

+ `Event.all`
  + Returns an array of all `Event`s
+ `Event#attendees`
  + Returns an array of `Attendee`s that have `Ticket`s for the `Event`
+ `Event#sell_ticket`
  + Accepts an `Attendee` instance as an argument and makes it so that, when `#attendees` is called on this `Event` instance, that `Attendee` instance will show up in the array.
+ `Event#money_made`
  + Returns an integer that is the product of the number of `Ticket`s sold for this event and the price of the `Ticket`.
+ `Event#average_age`
  + Returns the average age of all the `Attendee`s that will be at the `Event`

### `Ticket`

A `Ticket` instance represents an `Attendee`'s purchase of a `Ticket` for an `Event`, or an `Event`'s sale of a `Ticket`. All a `Ticket` needs to be initiated is an `Attendee` and an `Event`

+ `Ticket.all`
  + Returns an array of all Tickets

### `Attendee`

Each `Attendee` should have a name that is a string and an age that is an integer.

+ `Attendee.all`
  + Returns an array of all `Attendees`
+ `Attendee#events`
  + Returns an array of all `Event`s that the `Attendee` is attending.
+ `Attendee#buy_ticket`
  + Accepts an `Event` instance as an argument and makes it so that, when `#events` is called on this `Attendee` instance, the passed-in `Event` will appear in the resulting array.
+ `Attendee#money_spent`
  + Returns the dollar amount this `Attendee` has spent on `Tickets` for `Events`
