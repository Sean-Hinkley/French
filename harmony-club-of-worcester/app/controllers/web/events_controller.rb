class Web::EventsController < ApplicationController

  def index
    @events = Event.where.not(title: "«Temp Event»")
    @nonRecurringEvents = Event.where("title != ? AND occurence = ?", "«Temp Event»", 0).sort_by {|event| event.eventstart}
    @recurringEvents = Event.where("title != ? AND occurence != ?", "«Temp Event»", 0).sort_by {|event| event.schedule.next_occurrence()}
    @recurringEvents = @recurringEvents.take(4)
    @nonRecurringEvents = @nonRecurringEvents.take(4)
    @upComingEvents = []
    @sorted = false
    if @nonRecurringEvents.any?
      if @recurringEvents.any?
        @earliest = @nonRecurringEvents.first
      else
        @nonRecurringEvents.each do |event|
          @upComingEvents.append(event)
        end
        @sorted = true
      end
    else
      @recurringEvents.each do |event|
        @upComingEvents.append(event)
      end
      @sorted = true
    end
    if @events.any?
      while @sorted == false
        if @nonRecurringEvents.any?
          if @recurringEvents.any?
            @earliest = @nonRecurringEvents.first
          else
            @nonRecurringEvents.each do |event|
              @upComingEvents.append(event)
            end
            @sorted = true
          end
        else
          @recurringEvents.each do |event|
            @upComingEvents.append(event)
          end
          @sorted = true
        end
        @nonRecurringEvents.each do |event|
          @recurringEvents.each do |rEvent|
            if event.eventstart < rEvent.schedule.next_occurrence()
              if @earliest.schedule != nil
                if event.eventstart < @earliest.schedule.next_occurrence()
                  @earliest = event
                end
              else
                if event.eventstart < @earliest.eventstart
                  @earliest = event
                end
              end
            elsif event.eventstart > rEvent.schedule.next_occurrence()
              if @earliest.schedule != nil
                if rEvent.schedule.next_occurrence() < @earliest.schedule.next_occurrence()
                  @earliest = rEvent
                end
              else
                if rEvent.schedule.next_occurrence() < @earliest.eventstart
                  @earliest = rEvent
                end
              end
            end
          end
        end
        if @earliest.schedule == nil
          @upComingEvents.append(@nonRecurringEvents.delete(@earliest))
        else
          @upComingEvents.append(@recurringEvents.delete(@earliest))
        end
        if @upComingEvents.length() == 4 or @upComingEvents.length() == @events.length()
          @sorted = true
        elsif @nonRecurringEvents.any? == false
          @recurringEvents.take(4 - @upComingEvents.length()).each do |event|
            @upComingEvents.append(event)
          end
          @sorted = true
        elsif @recurringEvents.any? == false  
          @nonRecurringEvents.take(4 - @upComingEvents.length()).each do |event|
            @upComingEvents.append(event)
          end
         @sorted = true
        end
      end
    end

    if @upComingEvents.any?
      @noUpcoming = false
    else
      @noUpcoming = true
    end
  end

  def show
    @event = Event.find(params[:id])
    if @event.schedule != nil
      @nextEvent = @event.schedule.next_occurrence()
    end
  end
end
