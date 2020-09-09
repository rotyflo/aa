require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each do |name, capacity|
            @rooms[name] = Room.new(capacity)
        end
    end

    def name
        @name.split.map(&:capitalize).join(' ')
    end

    def rooms
        p @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        else
            p 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.any? { |name, room| !room.full? }
    end

    def list_rooms
        @rooms.each { |name, room| puts name + ' : ' + room.available_space.to_s }
    end
end
