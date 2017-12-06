include 'node'

class Bacon

  def find_kevin_bacon(actor)
    films = []
    actor.film_actor_hash.each do |title, actors|
      actors.each do |actor|
        if actor == "Kevin Bacon"
           films.push(title)
        else
          find_kevin_bacon(actor)
        end
      end
    end
    if films.length <= 6 && films.length > 0
      puts "Connected by #{films.all} films."
    else
      puts "Not connected by 6 or fewer films."
    end
  end
end
